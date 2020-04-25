#!/bin/sh
echo '[+] install pre-requirements.'
echo '[-] update package list.'
sudo apt update
echo '[-] install all.'
sudo apt install -y build-essential figlet git git-flow openssl python3-pip tmux vim-* xclip zsh
echo '[-] make directory for github.com.'
cd $HOME
mkdir -p ~/github.com/Le96
echo '[-] make update script.'
echo -e '#!/bin/sh\nfind . -type d -regextype egrep -regex \x27./[^/]+/[^/]+\x27 | \\\n  xargs -i sh -c \x27echo -n {}": "; cd {}; git pull && git submodule update --init --recursive\x27' > ~/github.com/_update.sh
chmod +x ~/github.com/_update.sh
echo '[-] install body of dotfiles.'
git clone https://github.com/Le96/dotfiles.git ~/github.com/Le96/dotfiles
echo '[+] launch install.sh.'
sh ~/github.com/Le96/dotfiles/install.sh
