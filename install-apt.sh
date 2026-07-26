#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Configurando sistema APT..."

sudo apt update

if [ -f "$DOTFILES/packages-apt.txt" ]; then
  xargs sudo apt install -y < "$DOTFILES/packages-apt.txt"
else
  sudo apt install -y git curl wget jq tree eza bat fd-find ripgrep fzf zoxide starship htop btop
fi

"$DOTFILES/apply.sh"

echo "Sistema APT configurado."
