#!/usr/bin/env bash

# https://yazi-rs.github.io/docs/installation#debian

sudo apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep imagemagick

# 古いバージョンだと動かないので、zoxide, fzf は最新をインストールする
# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

# yazi
curl -LO https://github.com/sxyazi/yazi/releases/download/v26.1.22/yazi-x86_64-unknown-linux-gnu.deb
sudo dpkg -i yazi-x86_64-unknown-linux-gnu.deb
rm yazi-x86_64-unknown-linux-gnu.deb
