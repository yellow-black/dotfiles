#!/usr/bin/env bash

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim

# IME 自動切換え
curl -LO https://github.com/kyoh86/zenhan/releases/download/v0.0.1/zenhan.exe
sudo mv zenhan.exe ~/.local/bin/zenhan.exe
sudo chmod +x ~/.local/bin/zenhan.exe

# dot_config/nvim/ で既に管理されているため、以下の操作は不要
# # https://www.lazyvim.org/installation

# # required
# mv ~/.config/nvim{,.bak}

# # optional but recommended
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}

# git clone https://github.com/LazyVim/starter ~/.config/nvim
# rm -rf ~/.config/nvim/.git
