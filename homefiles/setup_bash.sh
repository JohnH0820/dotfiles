#!/bin/bash

set -e

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET_ALIAS="$HOME/.bash_aliases"
SOURCE_ALIAS="$REPO_DIR/.bash_aliases"
BACKUP_ALIAS="$HOME/.bash_aliases.backup"

echo "Checking for existing ~/.bash_aliases..."
if [ -f "$TARGET_ALIAS" ]; then
    echo "Backing up existing .bash_aliases to $BACKUP_ALIAS"
    mv "$TARGET_ALIAS" "$BACKUP_ALIAS"
fi

echo "Creating symbolic link for .bash_aliases"
ln -s "$SOURCE_ALIAS" "$TARGET_ALIAS"

if ! grep -q '\.bash_aliases' "$HOME/.bashrc"; then
    echo "Appending source line to ~/.bashrc"
    echo -e "\nif [ -f ~/.bash_aliases ]; then\n    . ~/.bash_aliases\nfi" >> "$HOME/.bashrc"
fi

echo "✅ Done! Run: source ~/.bashrc"

