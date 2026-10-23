#!/usr/bin/env bash
# Installa l'Agent Company OS in un progetto esistente, senza sovrascrivere nulla.
# Uso: ./install.sh /percorso/del/tuo/progetto   (default: cartella corrente)
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-.}"
mkdir -p "$DEST"
DEST="$(cd "$DEST" && pwd)"

if [ "$SRC" = "$DEST" ]; then
  echo "Sei già dentro il kit: avvia 'claude' qui e scrivi /kickoff"
  exit 0
fi

echo "Installo Agent Company OS in $DEST"
cd "$SRC"
find .claude company team docs -type f ! -name '.DS_Store' ! -path '.claude/settings.local.json' | while read -r f; do
  if [ -e "$DEST/$f" ]; then
    echo "  = $f (esiste già, lasciato com'è)"
  else
    mkdir -p "$DEST/$(dirname "$f")"
    cp "$f" "$DEST/$f"
    echo "  + $f"
  fi
done

if [ ! -e "$DEST/CLAUDE.md" ]; then
  cp CLAUDE.md "$DEST/CLAUDE.md"
  echo "  + CLAUDE.md"
elif grep -q "Agent Company OS" "$DEST/CLAUDE.md"; then
  echo "  = CLAUDE.md (kit già presente)"
else
  printf '\n\n' >> "$DEST/CLAUDE.md"
  cat CLAUDE.md >> "$DEST/CLAUDE.md"
  echo "  ~ CLAUDE.md (regole del kit aggiunte in fondo al tuo)"
fi

cat <<MSG

Fatto! Prossimi passi:
  cd "$DEST"
  claude
  /kickoff
MSG
