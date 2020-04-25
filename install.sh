#!/bin/sh
# $ figlet dotfiles
echo '     _       _    __ _ _\n  __| | ___ | |_ / _(_) | ___  ___\n / _` |/ _ \| __| |_| | |/ _ \/ __|\n| (_| | (_) | |_|  _| | |  __/\__ \\\n \__,_|\___/ \__|_| |_|_|\___||___/\n'

echo '[+] install pre-requirements.'
echo '[-] update package list.'
sudo apt update
echo '[-] install all.'
sudo apt install build-essential git tmux vim-* xclip zsh
echo '[-] make directory for github.com.'
cd $HOME
mkdir github.com
echo '[-] make update script.'
echo -e '#!/bin/sh\nfind . -type d -regextype egrep -regex \x27./[^/]+/[^/]+\x27 | \\\n  xargs -i sh -c \x27echo -n {}": "; cd {}; git pull && git submodule update --init --recursive\x27' > _update.sh
chmod +x _update.sh
cd $HOME

echo '[+] make zsh setting.'
echo '[-] change default shell to zsh.'
chsh -s $(which zsh)
echo '[-] install prezto.'
cd $HOME/github.com
mkdir sorin-ionescu
cd sorin-ionescu
git clone --recursive https://github.com/sorin-ionescu/prezto.git
cd $HOME
ln -s ~/github.com/sorin-ionescu/prezto ~/.zprezto
echo '[-] setup prezto.'
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo '[-] add my favorite preferences.'
sed -i -e "s/#   '0.0.0.0'/  '0.0.0.0'/" $HOME/.zpreztorc
sed -i -e "s/#   'rm\*-rf\*'/  'rm\*-rf\*'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:\*:\*'/zstyle ':prezto:\*:\*'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:autosuggestions:color'/zstyle ':prezto:module:autosuggestions:color'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:completion:\*:hosts'/zstyle ':prezto:module:completion:\*:hosts'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:editor'/zstyle ':prezto:module:editor'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:git:status:ignore'/zstyle ':prezto:module:git:status:ignore'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:history-substring-search/zstyle ':prezto:module:history-substring-search/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:prompt'/zstyle ':prezto:module:prompt'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:python:virtualenv'/zstyle ':prezto:module:python:virtualenv'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:syntax-highlighting' highlighters/zstyle ':prezto:module:syntax-highlighting' highlighters 'main' 'brackets' 'pattern' 'line' 'cursor' 'root'/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:syntax-highlighting' pattern/zstyle ':prezto:module:syntax-highlighting' pattern/" $HOME/.zpreztorc
sed -i -e "s/# zstyle ':prezto:module:terminal/zstyle ':prezto:module:terminal/" $HOME/.zpreztorc
sed -i -e "s/theme 'sorin'/theme 'powerlevel9k'/" $HOME/.zpreztorc
echo '[-] download and install my favorite font.'
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
mkdir /tmp/FiraCode
unzip /tmp/FiraCode.zip -d /tmp/FiraCode
sudo mkdir /usr/share/fonts/opentype/firacode
sudo cp /tmp/FiraCode/*.otf /usr/share/fonts/opentype/firacode
fc-cache -f  # -v
# TODO: install to gnome-terminal

echo '[+] make vim setting.'
echo '[-] install dein.vim.'
cd $HOME/github.com
mkdir Shougo
cd Shougo
git clone https://github.com/Shougo/dein.vim
# TODO

echo '[+] make tmux setting.'


echo '[+] make  setting.'



echo '[*] finish!'
