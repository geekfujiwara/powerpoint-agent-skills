[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidatePattern('^v[0-9]+\.[0-9]+\.[0-9]+$')]
    [string]$Version
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$root = Split-Path $PSScriptRoot -Parent
& (Join-Path $PSScriptRoot 'Test-Skills.ps1')
Add-Type -AssemblyName System.IO.Compression.FileSystem
$dist = Join-Path $root 'dist'
New-Item -ItemType Directory -Force -Path $dist | Out-Null
if (@(Get-ChildItem -LiteralPath $dist -Force).Count) {
    throw 'dist must be empty. Move existing assets aside before building another release.'
}
$skills = @(Get-ChildItem -LiteralPath (Join-Path $root 'skills') -Directory | Sort-Object Name)
$license = Join-Path $root 'LICENSE'
$notice = Join-Path $PSScriptRoot 'package-notice.txt'

$path = Join-Path $dist "powerpoint-agent-skills-$Version.zip"
$zip = [IO.Compression.ZipFile]::Open($path, [IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($skill in $skills) {
        $sources = [ordered]@{
            'SKILL.md' = Join-Path $skill.FullName 'SKILL.md'
            'LICENSE.txt' = $license
            'NOTICE.md' = $notice
        }
        foreach ($entryName in $sources.Keys) {
            $entry = $zip.CreateEntry("$($skill.Name)/$entryName", [IO.Compression.CompressionLevel]::Optimal)
            $entry.LastWriteTime = [DateTimeOffset]::new(2026, 1, 1, 0, 0, 0, [TimeSpan]::Zero)
            $inputStream = [IO.File]::OpenRead($sources[$entryName])
            $outputStream = $entry.Open()
            try { $inputStream.CopyTo($outputStream) }
            finally { $outputStream.Dispose(); $inputStream.Dispose() }
        }
    }
} finally { $zip.Dispose() }
$hashes = @(Get-ChildItem -LiteralPath $dist -Filter '*.zip' -File | Sort-Object Name | ForEach-Object {
    $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    "$hash  $($_.Name)"
})
[IO.File]::WriteAllLines((Join-Path $dist 'SHA256SUMS.txt'), [string[]]$hashes, [Text.UTF8Encoding]::new($false))
& (Join-Path $PSScriptRoot 'Test-Skills.ps1') -PackageDirectory $dist -Version $Version
Write-Output "Release assets created in $dist"
