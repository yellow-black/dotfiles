#!/usr/bin/env bash

# https://f2.freshman.tech/guide/getting-started
curl -LO https://github.com/ayoisaiah/f2/releases/download/v2.2.2/f2_2.2.2_linux_amd64.deb
sudo dpkg -i f2_2.2.2_linux_amd64.deb
rm f2_2.2.2_linux_amd64.deb

sudo apt install -y eza bat git-delta btop gh

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
