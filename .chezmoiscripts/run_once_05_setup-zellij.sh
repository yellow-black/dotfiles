#!/usr/bin/env bash

# 左上の " Zellij "(Session Name) -> " "(Session Name) に変更
# quit 時の "Bye from Zellij!" -> " " に変更

sudo apt install -y protobuf-compiler

mkdir -p ~/src
cd ~/src
git clone git@github.com:zellij-org/zellij.git
cd zellij

latest_tag=$(git describe --tags --abbrev=0)
git checkout "$latest_tag"

sed -i 's/ Zellij / /g' default-plugins/tab-bar/src/line.rs
sed -i 's/ Zellij / /g' default-plugins/compact-bar/src/line.rs
sed -i 's/Bye from Zellij!/ /g' zellij-client/src/lib.rs
sed -i 's/Bye from Zellij!/ /g' zellij-utils/src/ipc.rs

cargo xtask build --release
cp target/release/zellij ~/.local/bin/
