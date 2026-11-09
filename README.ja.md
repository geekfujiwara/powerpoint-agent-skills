# PowerPoint Agent Skills

[<kbd>English</kbd>](README.md) [<kbd>日本語</kbd>](README.ja.md)

**PowerPoint の Copilot（エージェントモード）**向けカスタムスキル集です。
既存の11スキルを9スキルに整理し、用途・操作範囲・安全性を明確にしました。
Microsoft 公式製品・公式配布物ではない、コミュニティによる独立したプロジェクトです。

**[ZIP をダウンロード](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)**
 · [統合・名称変更の対応表](docs/MIGRATION.md#日本語)
 · [公開前チェック](docs/REVIEW.md#日本語)
 · [MIT ライセンス](LICENSE)

## スキルの違いと選び方

| スキル | 主な用途 | 関連性・依頼例 |
|---|---|---|
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

## OneDrive の正しい場所に配置する

PowerPoint の Copilot と同じアカウントの OneDrive を使用してください。
利用可否は Microsoft 365 の契約、組織の設定、提供状況によって異なります。
スキルのメニューがない場合は、管理者に利用条件を確認してください。

1. PowerPoint の **Copilot → 設定（…）→ スキルの管理 → カスタムスキル**を開きます。
   表示名は製品の言語・バージョンにより異なる場合があります。
2. **OneDrive フォルダーの作成（Create OneDrive folder）**を選び、
   **スキルフォルダーを開く（Open skills folder）**で開きます。
   **PowerPoint が開いたフォルダーを使用してください。**
   ローカルのパスを推測したり、任意の場所に `Skills` を作ったりしないでください。
3. [Releases](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
   から `powerpoint-agent-skills-v1.0.0.zip` をダウンロードし、PC上で展開します。
4. 展開された**各スキルのフォルダーを、OneDrive のスキルフォルダー直下へコピー**します。
   必要なものだけでも構いません。`skills` や `powerpoint-agent-skills-v1.0.0` という
   外側のフォルダーはコピーしないでください。ライセンス・注意書きは各スキル内に残します。
5. OneDrive の同期を待ち、PowerPoint の**スキルの管理／カスタムスキル → 更新
   （Refresh）**を選択し、使いたいスキルを有効にします。
6. 入力欄の **＋ → スキルの選択（Choose skills）**から選ぶか、
   `@スキル名` で指定します。VS Code の `/` コマンドとは異なります。

配置例（最上段は PowerPoint が開いたフォルダーを指す仮表記です）:

```text
<PowerPoint が開いた OneDrive スキルフォルダー>\
  presentation-theme\
    SKILL.md
    LICENSE.txt
    NOTICE.md
  slide-illustrations\
    SKILL.md
    LICENSE.txt
    NOTICE.md
  highlight-key-points\
    SKILL.md
    ...
```

ファイル名は必ず `SKILL.md` にします。先頭の YAML の `name` と、
そのファイルを直接含むフォルダー名を完全一致させてください。
ZIP を OneDrive に置くだけでは導入されません。
リポジトリの `.github`・`docs`・`scripts` は配置不要です。

### 代替方法：PowerPoint から個別 ZIP をアップロード

**＋ → スキルの選択 → スキルの管理 → スキルの追加（Add skill）**で、
`<skill-name>-v1.0.0.zip` をアップロードすると OneDrive に保存されます。
全スキル一括 ZIP は**展開して OneDrive に配置するためのもの**です。
複数スキル入り ZIP の一括インポート対応は前提としていません。
配布 ZIP は Markdown／テキストのみで、画像・PDF・入れ子の ZIP は含みません。

## 使う順番と組み合わせ

1. 対象範囲とテーマを決め、文章・元データを渡します。
2. 階層図・工程図・ロングテールなど、目的に合う図解を作ります。
3. 必要な挿絵を加え、文章・強調色を整えます。
4. 重複があれば候補を確認してから削除を承認します。
5. アニメーションは最後に適用し、スライドショーで再生確認します。

ブランド指定や依頼内容が、スキルの既定値より優先されます。
競合するデザイン指定を無条件に重ねないでください。大きな変更前にはバックアップを推奨します。
スキルは指示書であり、実行結果を保証するプログラムではありません。
画像生成・描画・アニメーションなどの機能は環境依存です。
未対応の操作は説明し、静止画だけでアニメーションを検証済みと扱わない設計です。

## 旧スキルからの移行

[旧名称と新名称の対応表](docs/MIGRATION.md#日本語)を参照してください。
古いスキルを削除または無効化してから新しいものを有効にすると、指示の競合を避けられます。
OneDrive 側で変更した後は更新してください。名称変更時にはフォルダー名と `name` を両方変更します。

## メンテナンス・リリース

PowerShell 7（`pwsh`）を使用します。追加パッケージは不要です。

```powershell
pwsh -NoProfile -File .\scripts\Test-Skills.ps1
pwsh -NoProfile -File .\scripts\New-SkillPackages.ps1 -Version v1.0.0
pwsh -NoProfile -File .\scripts\Test-Skills.ps1 -PackageDirectory .\dist -Version v1.0.0
```

一括 ZIP、9個の個別 ZIP、`SHA256SUMS.txt` を生成します。
ZIP 内の正確なパス、ファイル内容、ライセンス同梱も検証します。
生成先 `dist` と元の ZIP はコミットしません。CI は push／PR 時に検証し、
`v*` タグでは GitHub Release に ZIP とチェックサムを公開します。
変更時の注意点は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。

## 公式仕様・確認範囲

- [Microsoft 公式：PowerPoint のカスタムスキル](https://support.microsoft.com/en-us/powerpoint/copilot/copilot-in-powerpoint-skills)
- [Agent Skills 標準仕様](https://agentskills.io/specification)

VS Code のエージェント設定ではなく、**PowerPoint カスタムスキル**として整理しています。
YAML は標準の `name`・`description`・`license` のみを使用し、各スキルを独立フォルダーに配置しています。
形式と ZIP 構造は自動検証しますが、PowerPoint での認識・実際の生成結果は利用環境で確認してください。
