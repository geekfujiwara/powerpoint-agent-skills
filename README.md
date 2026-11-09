# PowerPoint Agent Skills

[<kbd>English</kbd>](README.md) [<kbd>日本語</kbd>](README.ja.md)

Reusable custom skills for **Copilot in PowerPoint (agent mode)**. Nine focused
skills consolidate eleven original recipes into safer, easier-to-discover workflows.
This is an independent community project, not a Microsoft product or endorsement.

**[Download ZIPs](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)**
 · [Differences and migration](docs/MIGRATION.md)
 · [Publication review](docs/REVIEW.md)
 · [MIT license](LICENSE)

## Choose a skill

| Skill | Best for | Related skills / example request |
|---|---|---|
| [presentation-theme](skills/presentation-theme/SKILL.md) | Whole-deck light/dark styling; covers and diorama dividers | Sets the visual language; does not add animation. `@presentation-theme Restyle this deck with dark dividers and light content pages.` |
| [slide-illustrations](skills/slide-illustrations/SKILL.md) | Flat artwork sized to cards or empty slots | Optional companion to journey maps; supports two alternative art styles. `@slide-illustrations Add blue business illustrations to these cards without cropping.` |
| [highlight-key-points](skills/highlight-key-points/SKILL.md) | Bullets and selective blue emphasis | Text-only refinement, not a theme change. `@highlight-key-points Turn this paragraph into bullets and highlight key phrases.` |
| [remove-duplicate-shapes](skills/remove-duplicate-shapes/SKILL.md) | Confirmed duplicate cleanup | Maintenance, not general overlap repair. `@remove-duplicate-shapes Find duplicates on this slide and show me a deletion preview.` |
| [fade-in-rise-animation](skills/fade-in-rise-animation/SKILL.md) | Subtle automatic sequential reveals | Apply after layout is stable. `@fade-in-rise-animation Animate slide 3 top-to-bottom; keep its title fixed.` |
| [gradient-fill](skills/gradient-fill/SKILL.md) | Shape or text gradients without outlines | Local formatting, not deck restyling. `@gradient-fill Apply a blue-purple gradient to this title only.` |
| [hierarchy-diagram](skills/hierarchy-diagram/SKILL.md) | Parent/child organization or rollout states | Relationships, not a temporal journey. `@hierarchy-diagram Show this parent team and its three departments.` |
| [long-tail-chart](skills/long-tail-chart/SKILL.md) | Head/tail comparisons, conceptual or data-based | Native charts for actual data; concepts explicitly labeled. `@long-tail-chart Draw a conceptual long-tail diagram without invented values.` |
| [journey-map](skills/journey-map/SKILL.md) | Ordered handoffs or multi-stage journeys | Optional card artwork from slide-illustrations. `@journey-map Show these five handoff steps with alternating cards.` |

All skills are independently installable. No skill requires a local script,
Python, or another skill. Their bilingual descriptions aid discovery; instructions
are in English and preserve the user's requested output language.

## Install in the correct OneDrive folder

Use the OneDrive account associated with your PowerPoint Copilot session.
Availability depends on your Microsoft 365 subscription, organization settings,
and rollout. If the skills UI is missing, verify availability with your administrator.

1. In PowerPoint, open **Copilot → Settings (…) → Manage skills → Custom skills**.
2. Select **Create OneDrive folder**, then **Open skills folder**. Use the folder
   PowerPoint opens; do not guess a local path or create a random `Skills` folder.
   Its displayed name/location can vary by account or product version.
3. Download `powerpoint-agent-skills-v1.0.0.zip` from
   [Releases](https://github.com/geekfujiwara/powerpoint-agent-skills/releases/latest)
   and extract it locally.
4. Copy the extracted **individual skill folders** directly into that OneDrive
   skills folder. Do not copy the repository root or add an extra `skills` or
   `powerpoint-agent-skills-v1.0.0` wrapper folder. You may install only selected
   skill folders. Keep the bundled license/notice inside each skill folder.
5. Wait for OneDrive sync, return to **Manage skills / Custom skills**, select
   **Refresh**, and enable the desired skills.
6. In the prompt field, choose **+ → Choose skills**, or mention `@skill-name`.
   These instructions use PowerPoint's `@` invocation, not VS Code `/` commands.

Expected structure (the first line is a placeholder for the folder opened by PowerPoint):

```text
<OneDrive skills folder opened by PowerPoint>\
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

Each `SKILL.md` must keep its exact filename. Its frontmatter `name` must match
its immediate parent folder. A ZIP left in OneDrive is **not** an installed skill.
Do not upload the `.github`, `docs`, or `scripts` folders.

### Alternative: upload one skill ZIP in PowerPoint

In **+ → Choose skills → Manage skills → Add skill**, upload an individual
`<skill-name>-v1.0.0.zip` release asset. PowerPoint saves it to OneDrive.
The all-skills bundle is for **manual extraction and OneDrive placement**;
multi-skill ZIP import is not assumed to be supported.
Release ZIPs contain Markdown/text files only, no images, PDFs, or nested ZIPs.

## Recommended workflow

1. Choose the scope and theme; supply source content and data.
2. Build the appropriate hierarchy, journey, or long-tail visual.
3. Add optional illustrations, then refine text and gradients.
4. Preview duplicates before approving cleanup.
5. Apply optional animation last and verify in slide-show mode.

User instructions and brand requirements override recipe defaults. Do not enable
competing style instructions blindly. Back up important decks before broad edits.
Skills are guidance, not executable guarantees: tool availability, generation,
rendering, and animation support vary. The agent should explain unsupported actions
and never claim to have tested playback from a static image.

## Upgrade from the original skills

See the [complete old-to-new mapping](docs/MIGRATION.md). Remove or disable the
old entries before enabling replacements to avoid conflicting instructions.
Refresh after renaming or deleting OneDrive folders. Editing the display name
alone is insufficient: keep folder and frontmatter names identical.

## Maintain and release

Requires PowerShell 7 (`pwsh`); GitHub's Windows runner includes it.
No third-party packages are needed.

```powershell
pwsh -NoProfile -File .\scripts\Test-Skills.ps1
pwsh -NoProfile -File .\scripts\New-SkillPackages.ps1 -Version v1.0.0
pwsh -NoProfile -File .\scripts\Test-Skills.ps1 -PackageDirectory .\dist -Version v1.0.0
```

Packages include one all-skills ZIP, nine individual ZIPs, and `SHA256SUMS.txt`.
Archive checks verify exact paths and byte-for-byte contents, including licensing.
`dist` and the original source ZIP are not committed. CI validates every push/PR;
a `v*` tag also publishes the ZIPs and checksums to a GitHub Release.
See [CONTRIBUTING.md](CONTRIBUTING.md) for safety and validation requirements.

## Official format and limits

- [Microsoft: Use custom skills with Copilot in PowerPoint](https://support.microsoft.com/en-us/powerpoint/copilot/copilot-in-powerpoint-skills)
- [Agent Skills specification](https://agentskills.io/specification)

These are **PowerPoint custom skills**, not VS Code agent configuration.
Only standard `name`, `description`, and `license` frontmatter fields are used.
Every skill has its own folder and stays well below the recommended 500 lines.
Format and package structure are checked locally; actual recognition and results
must still be checked in your PowerPoint environment.
