#!/bin/sh
echo '[+] install pre-requirements.'
echo '[-] update package list.'
sudo apt update
echo '[-] install all.'
sudo apt install -y build-essential figlet git git-flow openssl python3-pip tmux xclip zsh
apt list | grep '^vim' | cut -d '/' -f 1 | xargs sudo apt install -y
echo '[-] make directory for github.com.'
cd $HOME
mkdir -p ~/github.com/Le96
echo '[-] make update script.'
ln -s ~/github.com/Le96/dotfiles/rcfiles/_update.sh ~/github.com/_update.sh
echo '[-] install body of dotfiles.'
git clone https://github.com/Le96/dotfiles.git ~/github.com/Le96/dotfiles

echo '[+] launch install.sh.'
sh ~/github.com/Le96/dotfiles/install.sh
