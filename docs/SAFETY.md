# Usage and Safety / 利用上の注意

[<kbd>日本語</kbd>](#japanese) [<kbd>English</kbd>](#english) · [README](../README.md)

<a id="japanese"></a>

## 日本語

### 利用時の注意

- 重要なデッキはコピーやバージョン履歴を確保してから編集してください。
- 対象スライド・図形・文章を指定してください。スキルの既定値よりブランド指定や依頼内容が優先されます。
- 重複図形は見た目や位置だけで削除せず、内容・書式・依存関係を確認し、プレビューを承認してから削除します。
- 既存のアニメーションを置き換える場合は、失われる動作を確認してから承認してください。
- 実データと概念図を区別し、数値・出典・注記が正しいか確認してください。
- 図解の最適化では、既存の記述と提供資料を根拠にします。不足する情報は質問し、
  外部検索は依頼された場合だけ行います。図の簡略化で対立・不確実性・留保を消さないでください。
- 秘密情報や個人・顧客情報を公開スキルに含めないでください。
  画像生成には、利用を承認した非機密のシーン説明だけを使用してください。

### 自動検証の範囲

検証スクリプトは、スキルの名称・YAML・説明文長・行数・ローカルリンク・
代表的な秘匿情報パターン、ZIP の正確なパス・内容・チェックサムを確認します。
秘匿情報のパターン検査は補助的なもので、不存在を保証しません。

スキルは指示書であり、PowerPoint の機能を追加するプログラムではありません。
画像生成・編集・描画・アニメーションの対応状況は利用環境によって異なります。
形式への準拠は、Microsoft の認定や実行結果の保証を意味しません。

### PowerPoint で確認すること

1. OneDrive の所定フォルダーへ配置後、更新してスキルが認識されること。
2. 解凍先のすべてのスキルフォルダーが、余分な親フォルダーを挟まず配置されていること。
3. `@スキル名` で呼び出し、指定した範囲だけが編集されること。
4. 文字・図形の可読性、重なり、編集可能性、数値・出典、対象外の内容が保たれていること。
5. 重複削除では、承認した図形だけが削除されること。
6. アニメーションはスライドショーで再生し、開始条件・順序・最終位置・既存動作を確認すること。

<strong>自動検証だけで PowerPoint／OneDrive の動作確認済みとは扱いません。</strong>
静止画だけではアニメーションの再生を確認できません。

[導入手順へ](../README.md#japanese) · [English ↓](#english)

<a id="english"></a>

## English

### Usage precautions

- Keep a copy or recoverable version of important decks before editing.
- Specify target slides, shapes, or text. Your brand requirements and explicit
  instructions take precedence over recipe defaults.
- Review content, appearance, and dependencies before approving duplicate deletion.
  Position or visual similarity alone does not establish a duplicate.
- Review any animations that would be lost before approving timing replacement.
- Distinguish real data from conceptual diagrams; check values, sources, and notes.
- Diagram optimization uses existing content and supplied evidence. Ask for
  missing information and search externally only when requested. Simplification
  must not erase disagreements, uncertainty, or qualifications.
- Never include secrets or personal/customer data in public skills.
  Use only approved non-sensitive scene descriptions for image generation.

### Automated verification

The validator checks names, YAML metadata, description lengths, line counts,
local links, common private-data patterns, and exact ZIP paths, bytes, and checksums.
Pattern scanning is a limited safeguard, not a guarantee of absence.

Skills provide instructions; they do not add application capabilities.
Image generation, editing, rendering, and animation support vary by environment.
Formal compliance does not imply Microsoft certification or guaranteed results.

### Checks in PowerPoint

1. Place a skill in the app-created OneDrive folder, refresh, and confirm discovery.
2. Confirm all extracted skill folders are placed without an extra wrapper folder.
3. Invoke `@skill-name` and verify that only the requested scope changes.
4. Check typography, contrast, fit, editability, data, citations, and preservation
   of unrelated slide content.
5. Verify that only approved duplicates are removed.
6. Play animations in slide-show mode to check start conditions, order, final
   placement, and preservation of existing behavior.

<strong>Automated validation alone does not verify PowerPoint/OneDrive behavior.</strong>
A static preview cannot verify animation playback.

[Installation instructions](../README.md#english) · [日本語 ↑](#japanese)
