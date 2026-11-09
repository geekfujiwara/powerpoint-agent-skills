# Contributing / 変更時の注意

[English README](README.md) · [日本語 README](README.ja.md)

- Keep each skill independently usable with standard Agent Skills metadata.
- Match the folder and `name`; explain both what the skill does and when to use it.
- Use only public, redistributable examples. Never include personal/customer data,
  credentials, organization-specific links, source decks, or private archives.
- Preserve unrelated slide content. Preview destructive actions and require approval.
- Do not assume Python, local files, internal tools, or animation support.
- Update both READMEs and the migration guide when names or behavior change.
- Test on a non-sensitive copy in PowerPoint; distinguish formal validation from
  real discovery, visual inspection, and slide-show playback.
- Do not add image/PDF assets or nested ZIPs to skill packages.

Run from the repository root with PowerShell 7:

```powershell
pwsh -NoProfile -File .\scripts\Test-Skills.ps1
pwsh -NoProfile -File .\scripts\New-SkillPackages.ps1 -Version v1.0.0
pwsh -NoProfile -File .\scripts\Test-Skills.ps1 -PackageDirectory .\dist -Version v1.0.0
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
名称や動作を変える場合は両言語の README と移行ガイドを更新し、
上記の検証と PowerPoint 上での確認を分けて行ってください。
公開済みタグの上書きはせず、新しいバージョンでリリースします。
