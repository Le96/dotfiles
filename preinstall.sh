#!/bin/sh
echo '[+] install pre-requirements.'
echo '[-] update package list.'
sudo apt update
echo '[-] install all.'
sudo apt install build-essential figlet git openssl python3-pip tmux vim-* xclip zsh
echo '[-] make directory for github.com.'
cd $HOME
mkdir github.com
echo '[-] make update script.'
echo -e '#!/bin/sh\nfind . -type d -regextype egrep -regex \x27./[^/]+/[^/]+\x27 | \\\n  xargs -i sh -c \x27echo -n {}": "; cd {}; git pull && git submodule update --init --recursive\x27' > _update.sh
chmod +x _update.sh
echo '[-] install body of dotfiles.'
mkdir Le96
cd Le96
git clone https://github.com/Le96/dotfiles.git
cd dotfiles
echo '[+] launch install.sh.'
sh install.sh
