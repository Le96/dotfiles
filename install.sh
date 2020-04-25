#!/bin/sh
figlet Le96_dotfiles

echo '[+] download and install my favorite font.'
curl --output /tmp/FiraCode.zip -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
mkdir /tmp/FiraCode
unzip /tmp/FiraCode.zip -d /tmp/FiraCode
sudo mkdir -p /usr/share/fonts/opentype/firacode
sudo cp /tmp/FiraCode/*.otf /usr/share/fonts/opentype/firacode
fc-cache -fv


echo '[+] make powerline setting.'
echo '[-] install powerline-status via python3-pip.'
python3 -m pip install powerline-status

echo '[-] install powerline via github.'
mkdir ~/github.com/powerline
git clone https://github.com/powerline/powerline.git ~/github.com/powerline/powerline


echo '[+] make pyenv setting.'
echo '[-] install pyenv.'
mkdir ~/github.com/pyenv
git clone https://github.com/pyenv/pyenv.git ~/github.com/pyenv/pyenv
ln -s ~/github.com/pyenv/pyenv ~/.pyenv


echo '[+] make ssh setting.'
echo '[-] make default ssh key.'
mkdir ~/.ssh
ssh-keygen -C '' -f ~/.ssh/id_ed25519 -t ed25519


echo '[+] make tmux setting.'
echo '[-] install tpm.'
mkdir ~/github.com/tmux-plugins
git clone https://github.com/tmux-plugins/tpm.git ~/github.com/tmux-plugins/tpm
mkdir -p ~/.tmux/plugins
ln -s ~/github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo '[-] add favorite settings file.'
ln -fs ~/github.com/Le96/dotfiles/rcfiles/tmux.conf ~/.tmux.conf


echo '[+] make vim setting.'
echo '[-] install dein.vim.'
mkdir ~/github.com/Shougo
git clone https://github.com/Shougo/dein.vim.git ~/github.com/Shougo/dein.vim
mkdir -p ~/.cache/dein/repos
ln -s ~/github.com ~/.cache/dein/repos/github.com

echo '[-] add favorite settings file.'
ln -fs ~/github.com/Le96/dotfiles/rcfiles/vimrc ~/.vimrc


echo '[+] make zsh setting.'
#echo '[-] change default shell to zsh.'
#chsh -s $(which zsh)

echo '[-] install prezto.'
mkdir ~/github.com/sorin-ionescu
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/github.com/sorin-ionescu/prezto
ln -s ~/github.com/sorin-ionescu/prezto ~/.zprezto

echo '[-] setup prezto.'
ln -s ~/github.com/sorin-ionescu/prezto/runcoms/zlogin ~/.zlogin
ln -s ~/github.com/sorin-ionescu/prezto/runcoms/zlogout ~/.zlogout
ln -s ~/github.com/sorin-ionescu/prezto/runcoms/zshenv ~/.zshenv

echo '[-] install zinit.'
mkdir ~/github.com/zdharma
git clone https://github.com/zdharma/zinit.git ~/github.com/zdharma/zinit
mkdir ~/.zinit
ln -s ~/github.com/zdharma/zinit ~/.zinit/bin

echo '[-] add favorite settings files.'
ln -s ~/github.com/Le96/dotfiles/rcfiles/zpreztorc ~/.zpreztorc
ln -s ~/github.com/Le96/dotfiles/rcfiles/zprofile ~/.zprofile
ln -s ~/github.com/Le96/dotfiles/rcfiles/zshrc ~/.zshrc



echo '[*] finish!'
echo '[i] Please follow the instructions below:'
echo '    - $ chsh -s '$(which zsh)' '$(whoami)
echo '    - restart terminal'
echo '    - change font to "FiraCode Nerd Font Mono"'
echo '    - in tmux, press Ctrl-B + Shift-I'
echo '    - launch vim to load plugins'
echo '[i] Have a nice shell life!'
