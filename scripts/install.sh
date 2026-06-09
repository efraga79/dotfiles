#!/usr/bin/env bash

set -e

echo "Updating system..."
sudo apt update

echo "Installing base packages..."
sudo apt install -y \
  git \
  curl \
  wget \
  unzip \
  zip \
  build-essential \
  ca-certificates \
  gnupg \
  lsb-release \
  fzf \
  zoxide \
  bat \
  fd-find \
  eza \
  htop \
  btop \
  neofetch \
  tree \
  jq \
  ripgrep

echo "Installing Starship..."
if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
fi

echo "Done."
echo "Restart your terminal after running this script."
