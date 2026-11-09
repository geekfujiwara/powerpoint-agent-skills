[CmdletBinding()]
param(
    [string]$PackageDirectory,
    [ValidatePattern('^v[0-9]+\.[0-9]+\.[0-9]+$')]
    [string]$Version = 'v1.0.0'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$root = Split-Path $PSScriptRoot -Parent
$expected = @(
    'fade-in-rise-animation', 'gradient-fill', 'hierarchy-diagram',
    'highlight-key-points', 'journey-map', 'long-tail-chart',
    'presentation-theme', 'remove-duplicate-shapes', 'slide-illustrations'
)
$skills = @(Get-ChildItem -LiteralPath (Join-Path $root 'skills') -Directory | Sort-Object Name)
if (($skills.Name -join ',') -cne ($expected -join ',')) {
    throw 'Skill folders do not match the expected nine-skill catalog.'
}

foreach ($skill in $skills) {
    $path = Join-Path $skill.FullName 'SKILL.md'
    $text = [IO.File]::ReadAllText($path)
    if ($text.StartsWith([char]0xFEFF)) { throw "Unexpected BOM: $($skill.Name)" }
    $match = [regex]::Match($text, '\A---\r?\nname: ([a-z0-9]+(?:-[a-z0-9]+)*)\r?\ndescription: "([^"\r\n]+)"\r?\nlicense: MIT\r?\n---\r?\n([\s\S]+)\z')
    if (-not $match.Success) { throw "Invalid canonical frontmatter: $($skill.Name)" }
    if ($match.Groups[1].Value -cne $skill.Name -or $skill.Name.Length -gt 64) {
        throw "Invalid or mismatched name: $($skill.Name)"
    }
    if ($match.Groups[2].Value.Length -gt 1024) { throw "Description too long: $($skill.Name)" }
    if ($match.Groups[2].Value.Contains('\')) { throw "Unsupported YAML escape: $($skill.Name)" }
    if (($text -split '\r?\n').Count -gt 500) { throw "Skill exceeds 500 lines: $($skill.Name)" }
    if ($match.Groups[3].Value -match '(?m)^---\s*$') { throw "Extra frontmatter delimiter: $($skill.Name)" }
}

$files = @(
    Get-ChildItem -LiteralPath $root -File |
        Where-Object { $_.Extension -in @('.md', '.txt', '.yml', '.yaml', '.ps1') -or $_.Name -in @('LICENSE', '.gitignore') }
    foreach ($directory in @('skills', 'docs', 'scripts', '.github')) {
        Get-ChildItem -LiteralPath (Join-Path $root $directory) -Recurse -File
    }
)
$secretPatterns = @(
    '(?i)gh[pousr]_[A-Za-z0-9]{20,}',
    'github_pat_[A-Za-z0-9_]{20,}',
    '(?i)AKIA[0-9A-Z]{16}',
    '-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----',
    '(?i)(?:api[_-]?key|client[_-]?secret|password)\s*[:=]\s*["''][^"''\s]{8,}["'']',
    '(?i)[A-Z]:[\\/]+Users[\\/]+[^\\/\s]+',
    '(?i)\b[A-Z0-9._%+-]+@(?!users\.noreply\.github\.com\b)[A-Z0-9.-]+\.[A-Z]{2,}\b'
)
foreach ($file in $files) {
    $text = [IO.File]::ReadAllText($file.FullName)
    foreach ($pattern in $secretPatterns) {
        if ([regex]::IsMatch($text, $pattern)) {
            throw "Potential private data in $([IO.Path]::GetRelativePath($root, $file.FullName)); inspect locally."
        }
    }
    if ($file.Extension -ne '.md') { continue }
    foreach ($link in [regex]::Matches($text, '\[[^\]]+\]\(([^)]+)\)')) {
        $target = $link.Groups[1].Value
        if ($target -match '^(?:https?://|#)') { continue }
        $relative = ($target -split '#', 2)[0].Replace('/', [IO.Path]::DirectorySeparatorChar)
        $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $relative))
        if (-not $resolved.StartsWith($root + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Link escapes repository: $($file.Name)"
        }
        if (-not (Test-Path -LiteralPath $resolved)) { throw "Broken local link in $($file.Name): $target" }
    }
}

if ($PackageDirectory) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $packageRoot = (Resolve-Path -LiteralPath $PackageDirectory).Path
    $licenseBytes = [IO.File]::ReadAllBytes((Join-Path $root 'LICENSE'))
    $noticeBytes = [IO.File]::ReadAllBytes((Join-Path $root 'scripts\package-notice.txt'))
    $expectedAssets = @("powerpoint-agent-skills-$Version.zip", 'SHA256SUMS.txt')
    $expectedAssets += @($skills | ForEach-Object { "$($_.Name)-$Version.zip" })
    $actualAssets = @(Get-ChildItem -LiteralPath $packageRoot -File | Select-Object -ExpandProperty Name)
    if (@(Compare-Object ($expectedAssets | Sort-Object) ($actualAssets | Sort-Object)).Count) {
        throw 'Package directory contains missing or unexpected release assets.'
    }
    foreach ($archiveName in $expectedAssets | Where-Object { $_.EndsWith('.zip') }) {
        $included = if ($archiveName -eq "powerpoint-agent-skills-$Version.zip") {
            $skills
        } else {
            @($skills | Where-Object { "$($_.Name)-$Version.zip" -ceq $archiveName })
        }
        $entries = @{}
        foreach ($skill in $included) {
            $entries["$($skill.Name)/SKILL.md"] = [IO.File]::ReadAllBytes((Join-Path $skill.FullName 'SKILL.md'))
            $entries["$($skill.Name)/LICENSE.txt"] = $licenseBytes
            $entries["$($skill.Name)/NOTICE.md"] = $noticeBytes
        }
        $zip = [IO.Compression.ZipFile]::OpenRead((Join-Path $packageRoot $archiveName))
        try {
            if ($zip.Entries.Count -ne $entries.Count) { throw "Wrong entry count: $archiveName" }
            $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
            foreach ($entry in $zip.Entries) {
                if (-not $seen.Add($entry.FullName) -or -not $entries.ContainsKey($entry.FullName)) {
                    throw "Unexpected or duplicate entry in $archiveName"
                }
                $stream = $entry.Open()
                $memory = [IO.MemoryStream]::new()
                try {
                    $stream.CopyTo($memory)
                    if ([Convert]::ToBase64String($memory.ToArray()) -cne [Convert]::ToBase64String($entries[$entry.FullName])) {
                        throw "Content mismatch in $archiveName"
                    }
                } finally { $memory.Dispose(); $stream.Dispose() }
            }
        } finally { $zip.Dispose() }
    }
    $checksums = [IO.File]::ReadAllLines((Join-Path $packageRoot 'SHA256SUMS.txt'))
    $zipNames = @($expectedAssets | Where-Object { $_.EndsWith('.zip') } | Sort-Object)
    if ($checksums.Count -ne $zipNames.Count) { throw 'Incorrect checksum count.' }
    for ($i = 0; $i -lt $zipNames.Count; $i++) {
        $hash = (Get-FileHash -LiteralPath (Join-Path $packageRoot $zipNames[$i]) -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($checksums[$i] -cne "$hash  $($zipNames[$i])") { throw "Checksum mismatch: $($zipNames[$i])" }
    }
    Write-Output "Validated 10 ZIPs, exact contents, and SHA-256 checksums for $Version."
}
Write-Output 'Validated 9 skill definitions, local links, and publication text checks.'
