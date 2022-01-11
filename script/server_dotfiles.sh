#! /bin/sh bash
# @since   2022-01-11 21:42
# @author  zengshuai
# @version 1.0

# this script automate linux server env setting
# check JAVA_HOME before use java

cd
if [ -f ~/.bashrc ];then
    mv ~/.bashrc ~/.bashrc.origin
    ln -s ~/.dotfiles/bash/dot-bashrc ~/.bashrc
fi
ln -s ~/.dotfiles/bash/dot-bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/git/dot-gitconfig ~/.gitconfig
mkdir -p ~/.vim/autoload
ln -s ~/.dotfiles/servervim/dot-vimrc ~/.vimrc
cp ~/.dotfiles/nvim/.vim/plug.vim ~/.vim/autoload/
. ~/.bashrc
