# Migration / 統合・移行ガイド

[English](#english) | [日本語](#日本語) · [README](../README.md) · [日本語 README](../README.ja.md)

## English

Eleven original skills become nine. Only overlapping responsibilities are merged;
distinct tasks remain independently selectable.

| Original | Replacement | Decision |
|---|---|---|
| bullet-points-highlights | highlight-key-points | Rename; preserve typography and selective emphasis |
| card-illustration | slide-illustrations | Merge measurement and proportional placement |
| flat-modern-illustration | slide-illustrations | Merge as an alternative style; remove conflicting mandatory cropping |
| diorama-section-background | presentation-theme | Merge as the optional navy divider recipe |
| light-and-dark-design | presentation-theme | Merge as the deck theme and black miniature recipe |
| dedupe-overlapping-shapes | remove-duplicate-shapes | Rename; strengthen identity checks and deletion approval |
| fade-rise-animation | fade-in-rise-animation | Rename; preserve intended timings without mandatory destructive XML replacement |
| gradient-no-outline | gradient-fill | Rename; distinguish text from shape fill |
| hierarchy-illustration | hierarchy-diagram | Rename; scale editable geometry from available space |
| longtail-chart-slide | long-tail-chart | Rename; separate conceptual and real-data charts |
| wavy-journey-cards | journey-map | Rename; keep editable path/cards without mandatory cross-skill dependency |

### Preserved intent and intentional changes

- Original palettes, card layouts, miniature scenes, blue highlights, staggered
  entrances, hierarchies, and long-tail/journey visuals remain available.
- Theming offers **black/no overlay** or **navy/boundary blend**, rather than
  simultaneously requiring contradictory backgrounds.
- Illustration styles are alternatives. Proportional uncropped fitting replaces
  mandatory square generation and conflicting crop instructions.
- Exact old geometry is not portable across slide sizes. Layouts now measure
  available space; six journey cards and three hierarchy children are examples.
- Small 8.5-12 pt body defaults are replaced by a 14 pt readability target,
  with splitting preferred over silent shrinking.
- Gradients default to a readable linear direction; the original radial
  appearance remains available on request. Shape and text targets are separate.
- Animation has seven delay levels (0-600 ms), not the original description's
  inconsistent "six". Original 250/500 ms durations and rise distance are retained
  as approximate visual targets, not a claim of engine-specific playback support.
- Executable Python/XML snippets requiring unverified runtimes were removed.
  The skills use available PowerPoint capabilities and disclose unsupported work.
- Duplicate removal requires more than matching names/bounds/text; potentially
  different content is retained, and deletion needs an approved preview.
- Restyling does not automatically strip sources, clear slides, add covers,
  overwrite animations, or insert presenter details.

### Replace installed skills

1. Keep a private backup if you customized the originals.
2. Remove or disable old skills via PowerPoint's Manage skills, or remove their
   folders from the OneDrive skills folder.
3. Install replacement folders as described in the README and refresh.
4. Update saved prompts from `@old-name` to `@new-name`.
5. Test on a copy of a non-sensitive deck. Review appearance, editability,
   content, and animation playback separately.

No automatic migration touches your OneDrive or presentations.

## 日本語

11個を9個に整理しました。重複する役割のみ統合し、用途が異なるものは独立して残しています。

| 旧名称 | 新名称 | 整理内容 |
|---|---|---|
| bullet-points-highlights | highlight-key-points | 箇条書き・重要語の強調として明確化 |
| card-illustration | slide-illustrations | 採寸と画像配置を統合 |
| flat-modern-illustration | slide-illustrations | 選択できる画風として統合。強制トリミングを廃止 |
| diorama-section-background | presentation-theme | 紺色の箱庭区切りページとして統合 |
| light-and-dark-design | presentation-theme | 全体テーマと黒背景の箱庭レシピとして統合 |
| dedupe-overlapping-shapes | remove-duplicate-shapes | 同一性の確認・削除承認を強化 |
| fade-rise-animation | fade-in-rise-animation | 動きの意図を維持し、既存アニメーションの無断上書きを廃止 |
| gradient-no-outline | gradient-fill | 文字と図形の塗りを区別 |
| hierarchy-illustration | hierarchy-diagram | 階層図として明確化。実寸に合わせて配置 |
| longtail-chart-slide | long-tail-chart | 概念図と実データを区別 |
| wavy-journey-cards | journey-map | 工程・引き継ぎ図として明確化。他スキルへの必須依存を解消 |

### 維持した内容と意図的な変更

- 配色、カード、箱庭、青色強調、順次表示、階層・ロングテール・工程図の意図は維持しました。
- 黒背景・オーバーレイなし／紺背景・境界グラデーションを選択式にし、相反する指示を解消しました。
- イラストは画風を選び、実際の枠を採寸して等比配置します。正方形の強制生成・強制切り抜きはしません。
- 固定座標に依存せず、スライドの実寸に合わせます。6工程・3部門は固定要件ではなく例です。
- 8.5〜12 pt の小さな本文指定を避け、14 pt を目安に、必要ならページを分割します。
- グラデーションは読みやすい線形を既定とし、元の放射状は依頼時に選べます。文字と図形の対象も区別します。
- 0〜600 ms の遅延は「6段階」ではなく7段階に修正しました。250／500 ms と移動量の意図は残し、
  特定環境の再生を保証する固定 XML としては扱いません。
- 未確認の Python 実行環境や内部ツールに依存するコードを除き、利用可能な機能で実行し、未対応は明示します。
- 重複削除は名前・位置・文字だけで確定せず、内容・書式・依存関係を調べ、プレビュー承認後に行います。
- テーマ変更だけで出典削除、既存要素の一括削除、表紙追加、アニメーション置換、発表者情報追加は行いません。

### 導入済みスキルの置き換え

1. 独自変更がある場合は、旧スキルを非公開の場所へバックアップします。
2. PowerPoint のスキルの管理で旧スキルを無効化・削除するか、OneDrive の旧フォルダーを取り除きます。
3. README の手順で新しいフォルダーを配置し、更新します。
4. 保存済みプロンプトの `@旧名称` を `@新名称` に変更します。
5. 秘匿情報のないデッキのコピーで、内容・見た目・編集可能性・再生を分けて確認します。

このリポジトリは OneDrive やプレゼンテーションを自動変更しません。
