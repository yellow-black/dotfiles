#!/usr/bin/env bash

sudo apt update

# Install fish shell
sudo apt-add-repository -y ppa:fish-shell/release-4
sudo apt update
sudo apt install -y fish
sudo chsh -s $(which fish)

# Install starship (https://starship.rs/)
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Install fastfetch (https://github.com/fastfetch-cli/fastfetch)
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch
