#!/usr/bin/env bash
# Installs the SEO Night skill for Claude Code and OpenCode.
# Usage: curl -fsSL https://raw.githubusercontent.com/IncomeStreamSurfer/seo-night-skill/main/install.sh | bash
set -euo pipefail
REPO="https://github.com/IncomeStreamSurfer/seo-night-skill"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
git clone --depth 1 --quiet "$REPO" "$TMP/seo-night-skill"

# Claude Code reads ~/.claude/skills; OpenCode reads it too.
mkdir -p "$HOME/.claude/skills"
rm -rf "$HOME/.claude/skills/seo-night"
cp -R "$TMP/seo-night-skill/seo-night" "$HOME/.claude/skills/seo-night"
echo "✓ Skill installed: ~/.claude/skills/seo-night (Claude Code + OpenCode)"

# OpenCode: a /seo-night command that loads the skill.
if command -v opencode >/dev/null 2>&1 || [ -d "$HOME/.config/opencode" ]; then
  mkdir -p "$HOME/.config/opencode/commands"
  cp "$TMP/seo-night-skill/opencode/seo-night.md" "$HOME/.config/opencode/commands/seo-night.md"
  echo "✓ OpenCode command installed: /seo-night"
fi

echo
echo "Next: open your website's repo and run /seo-night"
