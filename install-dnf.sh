#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "Configurando sistema DNF..."

sudo dnf upgrade -y

if [ -f "$DOTFILES/packages-dnf.txt" ]; then
  xargs sudo dnf install -y < "$DOTFILES/packages-dnf.txt"
else
  sudo dnf install -y git curl wget jq tree eza bat fd-find ripgrep fzf zoxide starship htop btop
fi

"$DOTFILES/apply.sh"

echo "Sistema DNF configurado."
