#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Aplicando dotfiles..."

mkdir -p "$HOME/.config"

if [ -f "$DOTFILES/git/gitconfig" ]; then
  ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
fi

if [ -f "$DOTFILES/starship/starship.toml" ]; then
  ln -sf "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
fi

if [ -f "$DOTFILES/zsh/zshrc" ]; then
  ln -sf "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
fi

if [ -f "$DOTFILES/bash/bashrc" ]; then
  ln -sf "$DOTFILES/bash/bashrc" "$HOME/.bashrc"
fi

if [ -f "$DOTFILES/bash/profile" ]; then
  ln -sf "$DOTFILES/bash/profile" "$HOME/.profile"
fi

echo "Dotfiles aplicados."
