#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Configurando macOS..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

if [ -f "$DOTFILES/Brewfile" ]; then
  brew bundle --file="$DOTFILES/Brewfile"
else
  brew install git gh wget curl jq tree eza bat fd ripgrep fzf zoxide starship htop btop watchman nvm
fi

mkdir -p "$HOME/.nvm"

"$DOTFILES/apply.sh"

echo "macOS configurado."
