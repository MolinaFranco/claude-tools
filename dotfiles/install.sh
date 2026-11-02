#!/usr/bin/env bash
# Enlaza la config personal de Claude Code (dotfiles/) en ~/.claude/.
# Se puede correr varias veces. Si ya hay un archivo real (no symlink),
# lo guarda en ~/.claude/backups/ antes de reemplazarlo.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
BACKUP="$DEST/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"

mkdir -p "$DEST"

for f in settings.json CLAUDE.md keybindings.json; do
  [ -e "$SRC/$f" ] || continue
  target="$DEST/$f"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$SRC/$f" ]; then
    echo "ok       $f (ya enlazado)"
    continue
  fi
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mkdir -p "$BACKUP"
    mv "$target" "$BACKUP/$f.$STAMP"
    echo "backup   $f -> $BACKUP/$f.$STAMP"
  fi
  ln -sfn "$SRC/$f" "$target"
  echo "enlazado $f -> $SRC/$f"
done
