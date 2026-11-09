# Publication Review / 公開前チェック

[English](#english) | [日本語](#日本語) · [README](../README.md) · [日本語 README](../README.ja.md)

## English

Review date: 2026-11-09. Scope: the eleven original `SKILL.md` files supplied
in a ZIP, the nine rewritten skills, documentation, release automation, and
the release package structure. Original archives and presentations are not published.
The owner confirmed publication/redistribution rights and selected MIT.

### Confidentiality

The inspected original skill text contained no identified credentials, tokens,
personal contact details, tenant identifiers, private organization URLs, or
customer data. Generic business and department examples were generalized further.
The publication validator also rejects common credential patterns, private keys,
emails other than the public GitHub noreply trailer, and local user-profile paths.
Pattern scanning is a limited safeguard, not a guarantee of absence.

### Reliability changes

| Original concern | Resolution |
|---|---|
| Duplicate YAML metadata inside a skill body | One frontmatter block per skill |
| Ad hoc top-level `version` fields | Standard `name`, `description`, and `license` only |
| Conflicting black/navy backgrounds and crop rules | Explicit alternative recipes and proportional fitting |
| Name/bounds/text-only duplicate deletion | Content/appearance/dependency checks, approved preview, conservative exclusions |
| Replacing all slide timing without approval | Preserve existing timing; explicit approval for replacement |
| Hard-coded local Python/XML workflow | Capability-aware instructions; no claimed tools or silent success |
| Destructive slide clearing and tiny labels | Preserve unrelated content; adaptive layouts and readability targets |
| Concept curves confused with measured data | Explicit conceptual label or native chart with actual source values |
| Unnecessary cross-skill coupling | Every skill is usable independently |
| Internal content passed into artwork prompts | Approved non-sensitive scene descriptions only |

### Verification and limits

Automated checks cover the expected nine names, strict frontmatter subset,
description/name limits, line counts, Markdown links, publication text patterns,
and exact ZIP entry paths/bytes/checksums. They do not execute skill instructions
or prove PowerPoint runtime behavior.

The following remain **manual acceptance tests in PowerPoint**:

1. Copy a skill into the app-created OneDrive folder; refresh and confirm discovery.
2. Test an individual skill ZIP upload through Add skill.
3. Invoke each skill with `@name` on a non-sensitive copy of a deck.
4. Check typography, contrast, fit, data fidelity, editability, and preservation
   of unrelated slide content.
5. Approve a duplicate preview and verify only confirmed copies are removed.
6. Verify animation in slide-show playback, including existing timing preservation.

No live PowerPoint/OneDrive integration test is claimed by this repository review.
Do not interpret formal compliance as Microsoft certification or endorsement.

### Sources

- [Microsoft PowerPoint custom skills documentation](https://support.microsoft.com/en-us/powerpoint/copilot/copilot-in-powerpoint-skills):
  OneDrive creation/opening from the app, `SKILL.md`, folder/name matching,
  refresh, `@` invocation, ZIP upload, and unsupported image/PDF/nested-ZIP types.
- [Agent Skills specification](https://agentskills.io/specification):
  required metadata, name/description limits, optional license, and concise bodies.

## 日本語

確認日：2026年11月9日。対象は元 ZIP 内の11個の `SKILL.md`、整理後の9スキル、
説明文書、リリース自動化、ZIP の構造です。元 ZIP やプレゼンテーションは公開しません。
所有者に公開・再配布権限を確認し、MIT ライセンスを選択しました。

### 秘匿情報

確認した元スキル本文では、認証情報・トークン・個人の連絡先・テナント識別子・
組織内専用 URL・顧客データは見つかりませんでした。
汎用的な業務・部門の例もさらに一般化しました。
検証スクリプトでも代表的な認証情報、秘密鍵、メールアドレス
（公開 GitHub noreply トレーラーを除く）、ローカルのユーザーパスを検査します。
パターン検査だけで秘匿情報の不存在を保証するものではありません。

### 安全性・使いやすさの改善

- 本文に重複していた YAML と独自 `version` フィールドを整理しました。
- 背景色やトリミングの競合を解消し、デッキの実寸・ブランド指定を優先します。
- 図形削除は名前や位置だけで判断せず、内容・見た目・依存関係と承認を確認します。
- 既存アニメーションを無断で置換しません。静止画だけで再生確認済みとは扱いません。
- ローカル Python や特定の内部ツールを前提とせず、使えない操作は明示します。
- 既存要素の一括削除や小さすぎる文字を避け、実データと概念図を区別します。
- 他スキルへの必須依存を解消し、画像生成には承認された非機密の説明のみを使います。

### 検証範囲と残る確認

形式・名称・説明文長・リンク・代表的な秘匿情報パターン・ZIP の正確な階層と内容・
チェックサムを自動検査します。スキル本文の実行や PowerPoint の動作保証ではありません。

PowerPoint では、OneDrive フォルダー配置後の認識、個別 ZIP アップロード、
各 `@スキル名` の呼び出し、図形の編集可能性、内容保持、承認後の重複削除、
スライドショーでの再生を確認してください。
**本レビューでは実際の PowerPoint／OneDrive 統合テストは実施していません。**

公式仕様への準拠は、Microsoft の認定や動作保証を意味しません。
根拠資料は上記 [Sources](#sources) に記載しています。
