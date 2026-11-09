# Contributing / 変更時の注意

[日本語 README](README.md#japanese) · [English README](README.md#english)

- Keep each skill independently usable with standard Agent Skills metadata.
- Match the folder and `name`; explain both what the skill does and when to use it.
- Use only public, redistributable examples. Never include personal/customer data,
  credentials, organization-specific links, source decks, or private archives.
- Preserve unrelated slide content. Preview destructive actions and require approval.
- Do not assume Python, local files, internal tools, or animation support.
- Update both language sections of README.md when names or behavior change.
- Write for people discovering the skills; keep personal development notes and
  internal reorganization history out of user-facing documentation.
- Use explicit page anchors for language navigation. Use `<strong>` for emphasis
  next to Japanese text to avoid ambiguous Markdown delimiter boundaries.
- Test on a non-sensitive copy in PowerPoint; distinguish formal validation from
  real discovery, visual inspection, and slide-show playback.
- Do not add image/PDF assets or nested ZIPs to skill packages.
- Publish one ZIP containing all skill folders, plus its SHA-256 checksum file.
  Keep skill folders at the ZIP root so users can copy all of them to OneDrive.

Run from the repository root with PowerShell 7:

```powershell
pwsh -NoProfile -File .\scripts\Test-Skills.ps1
pwsh -NoProfile -File .\scripts\New-SkillPackages.ps1 -Version v1.0.1
pwsh -NoProfile -File .\scripts\Test-Skills.ps1 -PackageDirectory .\dist -Version v1.0.1
```

Maintainers release by pushing a new `vMAJOR.MINOR.PATCH` tag after these checks.
Do not overwrite a published version. Release assets are generated from the
tagged checkout, not uploaded from arbitrary local archives.

## 日本語

各スキルは単独で利用できるようにし、フォルダー名と `name` を一致させます。
何をするか・いつ使うかを説明に明記してください。
公開・再配布可能な例だけを使用し、個人情報・顧客情報・認証情報・組織内 URL・
元デッキ・非公開 ZIP は追加しません。
破壊的操作はプレビューと承認を必要とし、未対応の機能を実行済みとは報告しません。
名称や動作を変える場合は README 内の日英両セクションを更新し、
上記の検証と PowerPoint 上での確認を分けて行ってください。
公開文書は初めて使う人向けに書き、個人の作業メモや内部の整理経緯は含めません。
言語切り替えはページ内アンカーで行います。日本語の前後に強調を置く際は、
Markdown の区切り文字が曖昧にならないよう `<strong>` を使用します。
公開済みタグの上書きはせず、新しいバージョンでリリースします。
配布は全スキル入り ZIP 1個とチェックサムに統一します。
ZIP の直下に全スキルフォルダーを並べ、解凍後にまとめて OneDrive へコピーできる構造にします。
