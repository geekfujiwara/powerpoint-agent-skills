# PowerPoint Agent Skills

[<kbd>日本語</kbd>](#japanese) [<kbd>English</kbd>](#english)

<a id="japanese"></a>

## 日本語

Geek が仕事で便利だと感じ、繰り返し利用している
<strong>PowerPoint の Copilot（エージェントモード）向けスキル</strong>の公開場所です。
プレゼンテーションの見た目を整える、伝わる図解を作る、繰り返しの編集を減らすことで、
エージェントモードをより快適に使うことを目的としています。

必要なスキルだけを選び、自分のテンプレートや業務に合わせて活用してください。
Microsoft 公式製品・公式配布物ではない、個人による独立したプロジェクトです。

[ZIP をダウンロード](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
 · [利用上の注意](docs/SAFETY.md#japanese)
 · [MIT ライセンス](LICENSE)
 · [English ↓](#english)

### どんな作業を楽にするか

- <strong>見た目を整える：</strong>テーマ、挿絵、強調色をそろえる。
- <strong>伝わる形にする：</strong>文章を要約し、伝えたい結論に合う図解へ最適化する。
- <strong>仕上げを効率化する：</strong>重複図形を確認し、控えめな動きを付ける。

### スキルの違いと使い方

| スキル | 主な用途 | 関連性・依頼例 |
|---|---|---|
| [optimize-slide-diagram](skills/optimize-slide-diagram/SKILL.md) | 既存の記述から主張・関係を整理し、図解の型と構成を最適化 | テーマの見た目変更や特定の型の作成とは別。`@optimize-slide-diagram このページに書いてあることをもとに、伝えたい結論が一目で分かる図解にして。デザインは変えないで。` |
| [presentation-theme](skills/presentation-theme/SKILL.md) | 明暗デザイン、表紙、箱庭風の区切りページ | デッキ全体の見た目。アニメーションは別。`@presentation-theme 区切りは暗く、本文は明るいカード型に統一して。` |
| [slide-illustrations](skills/slide-illustrations/SKILL.md) | カードに収まるフラットイラスト | 2つの画風から選択。ジャーニー図の補助にも。`@slide-illustrations このカードに青系の挿絵を、切り抜かずに追加して。` |
| [highlight-key-points](skills/highlight-key-points/SKILL.md) | 箇条書き化と重要語の青色強調 | 見た目全体ではなく文章の整理。`@highlight-key-points この段落を箇条書きにし、重要語だけ青くして。` |
| [remove-duplicate-shapes](skills/remove-duplicate-shapes/SKILL.md) | 重複生成された図形の整理 | 単なる重なり修正とは別。`@remove-duplicate-shapes このページの重複候補を、削除せず一覧にして。` |
| [fade-in-rise-animation](skills/fade-in-rise-animation/SKILL.md) | フェード＋下からの順次表示 | レイアウト確定後に使用。`@fade-in-rise-animation 3ページ目を上から順に表示し、タイトルは固定して。` |
| [gradient-fill](skills/gradient-fill/SKILL.md) | 図形・文字のグラデーション | 部分的な装飾。デッキ全体の変更とは別。`@gradient-fill このタイトル文字だけ青紫のグラデーションにして。` |
| [hierarchy-diagram](skills/hierarchy-diagram/SKILL.md) | 親子関係、組織図、展開状況 | 時系列ではなく階層の表現。`@hierarchy-diagram この本部と3部門の関係を編集可能な図にして。` |
| [long-tail-chart](skills/long-tail-chart/SKILL.md) | ロングテールの概念・実データ比較 | 概念図は明示、実データはネイティブグラフ。`@long-tail-chart 架空の数値を入れず、ロングテールの概念図を作って。` |
| [journey-map](skills/journey-map/SKILL.md) | 波線＋交互カードの工程図 | 挿絵は slide-illustrations で補完可能。`@journey-map この5段階の引き継ぎをカードと波線で図解して。` |

各スキルは単独で導入できます。Python やローカルスクリプト、他スキルは必須ではありません。
発見用の説明文は日英併記、スキル本文は英語です。出力言語は依頼に従います。

#### 既存ページの図解を見直したいとき

`optimize-slide-diagram` は、選択中の1枚の記述と提供資料をもとに、伝えたい結論から
比較・フロー・階層・収束などの型を選び直します。フォント・配色・背景は維持します。
主張が曖昧な場合は案を提示し、不足する根拠は質問します。外部検索は依頼時のみです。
重複図形は検出・報告までとし、削除は別途承認後に扱います。

作る型が決まっている場合は `hierarchy-diagram` や `journey-map`、
デッキ全体の見た目を変える場合は `presentation-theme` を選んでください。

### OneDrive の正しい場所に配置する

PowerPoint の Copilot と同じアカウントの OneDrive を使用してください。
利用可否は Microsoft 365 の契約、組織の設定、提供状況によって異なります。
スキルのメニューがない場合は、管理者に利用条件を確認してください。

1. PowerPoint の <strong>Copilot → 設定（…）→ スキルの管理 → カスタムスキル</strong>を開きます。
   表示名は製品の言語・バージョンにより異なる場合があります。
2. <strong>OneDrive フォルダーの作成（Create OneDrive folder）</strong>を選び、
   <strong>スキルフォルダーを開く（Open skills folder）</strong>で開きます。
   <strong>PowerPoint が開いたフォルダーを使用してください。</strong>
   ローカルのパスを推測したり、任意の場所に `Skills` を作ったりしないでください。
3. [Releases](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
   にある<strong>全スキル入りの ZIP 1個</strong>（例：`powerpoint-agent-skills-v1.1.0.zip`）をダウンロードし、
   PC上で「すべて展開」します。解凍先のフォルダーに、10個のスキルフォルダーが並びます。
4. 解凍先にある<strong>スキルフォルダーをすべて選び、OneDrive のスキルフォルダー直下へコピー</strong>します。
   必要なものだけでも構いません。`skills` や `powerpoint-agent-skills-v1.1.0` という
   外側のフォルダーはコピーしないでください。ライセンス・注意書きは各スキル内に残します。
5. OneDrive の同期を待ち、PowerPoint の<strong>スキルの管理／カスタムスキル → 更新（Refresh）</strong>を選択し、
   使いたいスキルを有効にします。
6. 入力欄の <strong>＋ → スキルの選択（Choose skills）</strong>から選ぶか、
   `@スキル名` で指定します。VS Code の `/` コマンドとは異なります。

配置例（最上段は PowerPoint が開いたフォルダーを指す仮表記です）:

```text
<PowerPoint が開いた OneDrive スキルフォルダー>\
  fade-in-rise-animation\
    SKILL.md
  gradient-fill\
    SKILL.md
  hierarchy-diagram\
    SKILL.md
  highlight-key-points\
    SKILL.md
  journey-map\
    SKILL.md
  long-tail-chart\
    SKILL.md
  optimize-slide-diagram\
    SKILL.md
  presentation-theme\
    SKILL.md
    LICENSE.txt
    NOTICE.md
  remove-duplicate-shapes\
    SKILL.md
  slide-illustrations\
    SKILL.md
```

すべてのスキルフォルダーに `LICENSE.txt` と `NOTICE.md` も同梱しています。
ファイル名は必ず `SKILL.md` にします。先頭の YAML の `name` と、
そのファイルを直接含むフォルダー名を完全一致させてください。
ZIP を OneDrive に置くだけでは導入されません。
リポジトリの `.github`・`docs`・`scripts` は配置不要です。

配布 ZIP は<strong>展開してフォルダーを OneDrive に配置するためのもの</strong>です。
ZIP 自体を PowerPoint に一括アップロードする方法は前提としていません。
Markdown／テキストのみを含み、画像・PDF・入れ子の ZIP はありません。
同じリリースの `SHA256SUMS.txt` は、ダウンロードした ZIP の整合性確認用です。
OneDrive にコピーする必要はありません。

### 使う順番と組み合わせ

1. 対象範囲とテーマを決め、文章・元データを渡します。
2. 既存ページは `optimize-slide-diagram` で主張に合う構成を選ぶか、型が決まっていれば階層図・工程図などを作ります。
3. 必要な挿絵を加え、文章・強調色を整えます。
4. 重複があれば候補を確認してから削除を承認します。
5. アニメーションは最後に適用し、スライドショーで再生確認します。

ブランド指定や依頼内容が、スキルの既定値より優先されます。
大きな変更前にはバックアップを取り、生成結果を確認してください。
スキルは指示書であり、実行結果を保証するプログラムではありません。
画像生成・描画・アニメーションなどの機能は環境依存です。
詳しくは[利用上の注意と検証範囲](docs/SAFETY.md#japanese)を参照してください。

### メンテナンス・公式仕様

変更・検証・ZIP の作成手順は [CONTRIBUTING.md](CONTRIBUTING.md) にまとめています。
YAML は標準の `name`・`description`・`license` のみを使用し、各スキルを独立フォルダーに配置しています。
形式と ZIP 構造は自動検証しますが、PowerPoint での認識・実際の生成結果は利用環境で確認してください。

- [Microsoft 公式：PowerPoint のカスタムスキル](https://support.microsoft.com/en-us/powerpoint/copilot/copilot-in-powerpoint-skills)
- [Agent Skills 標準仕様](https://agentskills.io/specification)

[<kbd>English ↓</kbd>](#english) [<kbd>日本語の先頭へ ↑</kbd>](#japanese)

---

<a id="english"></a>

## English

This is Geek's collection of <strong>skills used repeatedly at work with Copilot
in PowerPoint (agent mode)</strong>. They make agent mode
more comfortable and productive by improving slide design, clarifying visual
explanations, and reducing repetitive editing.

Pick only the skills you need and adapt them to your templates and workflow.
This is an independent personal project, not a Microsoft product or endorsement.

[Download ZIPs](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
 · [Usage and safety](docs/SAFETY.md#english)
 · [MIT license](LICENSE)
 · [日本語 ↑](#japanese)

### What these skills help with

- <strong>Polish the design:</strong> coordinate themes, illustrations, and emphasis.
- <strong>Explain clearly:</strong> refine text and optimize diagram structures around the intended message.
- <strong>Finish efficiently:</strong> review duplicate shapes and add restrained motion.

### Choose and use a skill

| Skill | Best for | Related skills / example request |
|---|---|---|
| [optimize-slide-diagram](skills/optimize-slide-diagram/SKILL.md) | Restructuring an existing explanation around its takeaway and relationships | Not a theme change or a fixed diagram recipe. `@optimize-slide-diagram Use what this slide already says to make its takeaway clear at a glance. Keep the existing design.` |
| [presentation-theme](skills/presentation-theme/SKILL.md) | Whole-deck light/dark styling; covers and diorama dividers | Sets the visual language; does not add animation. `@presentation-theme Restyle this deck with dark dividers and light content pages.` |
| [slide-illustrations](skills/slide-illustrations/SKILL.md) | Flat artwork sized to cards or empty slots | Optional companion to journey maps; supports two alternative art styles. `@slide-illustrations Add blue business illustrations to these cards without cropping.` |
| [highlight-key-points](skills/highlight-key-points/SKILL.md) | Bullets and selective blue emphasis | Text refinement, not a theme change. `@highlight-key-points Turn this paragraph into bullets and highlight key phrases.` |
| [remove-duplicate-shapes](skills/remove-duplicate-shapes/SKILL.md) | Confirmed duplicate cleanup | Maintenance, not general overlap repair. `@remove-duplicate-shapes Find duplicates on this slide and show me a deletion preview.` |
| [fade-in-rise-animation](skills/fade-in-rise-animation/SKILL.md) | Subtle automatic sequential reveals | Apply after layout is stable. `@fade-in-rise-animation Animate slide 3 top-to-bottom; keep its title fixed.` |
| [gradient-fill](skills/gradient-fill/SKILL.md) | Shape or text gradients without outlines | Local formatting, not deck restyling. `@gradient-fill Apply a blue-purple gradient to this title only.` |
| [hierarchy-diagram](skills/hierarchy-diagram/SKILL.md) | Parent/child organization or rollout states | Relationships, not a temporal journey. `@hierarchy-diagram Show this parent team and its three departments.` |
| [long-tail-chart](skills/long-tail-chart/SKILL.md) | Head/tail comparisons, conceptual or data-based | Native charts for actual data; concepts explicitly labeled. `@long-tail-chart Draw a conceptual long-tail diagram without invented values.` |
| [journey-map](skills/journey-map/SKILL.md) | Ordered handoffs or multi-stage journeys | Optional card artwork from slide-illustrations. `@journey-map Show these five handoff steps with alternating cards.` |

All skills are independently installable. No skill requires a local script,
Python, or another skill. Their bilingual descriptions aid discovery; instructions
are in English and preserve the user's requested output language.

#### Improve an existing diagram

`optimize-slide-diagram` uses the selected slide's content and supplied evidence
to choose a comparison, flow, hierarchy, convergence, or another suitable structure.
It preserves the deck's fonts, palette, and background. It proposes unclear
takeaways, asks for missing evidence, and searches externally only when requested.
Duplicate candidates are reported, not deleted; cleanup needs separate approval.

Use `hierarchy-diagram` or `journey-map` when the required type is already known,
and `presentation-theme` when you want to change the deck's overall visual style.

### Install in the correct OneDrive folder

Use the OneDrive account associated with your PowerPoint Copilot session.
Availability depends on your Microsoft 365 subscription, organization settings,
and rollout. If the skills UI is missing, verify availability with your administrator.

1. In PowerPoint, open <strong>Copilot → Settings (…) → Manage skills → Custom skills</strong>.
2. Select <strong>Create OneDrive folder</strong>, then <strong>Open skills folder</strong>.
   Use the folder PowerPoint opens; do not guess a local path or create a random
   `Skills` folder. Its displayed name/location can vary by account or product version.
3. Download the <strong>single ZIP containing all skills</strong>
   (for example, `powerpoint-agent-skills-v1.1.0.zip`) from
   [Releases](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
   and choose Extract All. The extraction folder contains all ten skill folders.
4. Select <strong>all extracted skill folders</strong> and copy them directly into that
   OneDrive skills folder. Do not copy the repository root or add an extra `skills`
   or `powerpoint-agent-skills-v1.1.0` wrapper folder. You may install only selected
   skill folders. Keep the bundled license/notice inside each skill folder.
5. Wait for OneDrive sync, return to <strong>Manage skills / Custom skills</strong>,
   select <strong>Refresh</strong>, and enable the desired skills.
6. In the prompt field, choose <strong>+ → Choose skills</strong>, or mention
   `@skill-name`. These are PowerPoint's `@` mentions, not VS Code `/` commands.

Expected structure (the first line is a placeholder for the folder opened by PowerPoint):

```text
<OneDrive skills folder opened by PowerPoint>\
  fade-in-rise-animation\
    SKILL.md
  gradient-fill\
    SKILL.md
  hierarchy-diagram\
    SKILL.md
  highlight-key-points\
    SKILL.md
  journey-map\
    SKILL.md
  long-tail-chart\
    SKILL.md
  optimize-slide-diagram\
    SKILL.md
  presentation-theme\
    SKILL.md
    LICENSE.txt
    NOTICE.md
  remove-duplicate-shapes\
    SKILL.md
  slide-illustrations\
    SKILL.md
```

Every skill folder also includes `LICENSE.txt` and `NOTICE.md`.
Each `SKILL.md` must keep its exact filename. Its frontmatter `name` must match
its immediate parent folder. A ZIP left in OneDrive is not an installed skill.
Do not upload the `.github`, `docs`, or `scripts` folders.

The ZIP is for <strong>extraction and folder placement in OneDrive</strong>,
not for bulk ZIP import into PowerPoint. It contains Markdown/text files only,
no images, PDFs, or nested ZIPs.
The accompanying `SHA256SUMS.txt` lets you verify the downloaded ZIP's integrity;
it does not need to be copied to OneDrive.

### Recommended workflow

1. Choose the scope and theme; supply source content and data.
2. For an existing slide, use `optimize-slide-diagram` to choose a structure for
   its message, or use a specific diagram skill when the required type is known.
3. Add optional illustrations, then refine text and gradients.
4. Preview duplicates before approving cleanup.
5. Apply optional animation last and verify in slide-show mode.

User instructions and brand requirements override recipe defaults.
Back up important decks before broad edits and review generated results.
Skills are guidance, not executable guarantees: tool availability, generation,
rendering, and animation support vary.
See [usage, safety, and verification limits](docs/SAFETY.md#english).

### Maintenance and official format

See [CONTRIBUTING.md](CONTRIBUTING.md) for editing, validation, and ZIP packaging.
Only standard `name`, `description`, and `license` frontmatter fields are used.
Every skill has its own folder. Format and package structure are automatically
checked; actual recognition and results must still be checked in your PowerPoint environment.

- [Microsoft: Use custom skills with Copilot in PowerPoint](https://support.microsoft.com/en-us/powerpoint/copilot/copilot-in-powerpoint-skills)
- [Agent Skills specification](https://agentskills.io/specification)

[<kbd>日本語 ↑</kbd>](#japanese) [<kbd>Back to English ↑</kbd>](#english)
