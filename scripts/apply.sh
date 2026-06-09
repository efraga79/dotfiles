#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Backing up current configs..."
mkdir -p "$HOME/.dotfiles-backup"

[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$HOME/.dotfiles-backup/.bashrc.bak"
[ -f "$HOME/.profile" ] && cp "$HOME/.profile" "$HOME/.dotfiles-backup/.profile.bak"
[ -f "$HOME/.bash_aliases" ] && cp "$HOME/.bash_aliases" "$HOME/.dotfiles-backup/.bash_aliases.bak"
[ -f "$HOME/.gitconfig" ] && cp "$HOME/.gitconfig" "$HOME/.dotfiles-backup/.gitconfig.bak"

echo "Applying bash configs..."
cp "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"
cp "$DOTFILES_DIR/bash/profile" "$HOME/.profile"

[ -f "$DOTFILES_DIR/bash/bash_aliases" ] && cp "$DOTFILES_DIR/bash/bash_aliases" "$HOME/.bash_aliases"

echo "Applying git config..."
[ -f "$DOTFILES_DIR/git/gitconfig" ] && cp "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"

echo "Applying Starship config..."
mkdir -p "$HOME/.config"
[ -f "$DOTFILES_DIR/starship/starship.toml" ] && cp "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "Configs applied."
echo "Restart your terminal."
