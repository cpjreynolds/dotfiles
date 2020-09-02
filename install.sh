#!/bin/sh

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/Xresources ~/.Xresources
ln -s ~/dotfiles/Xmodmap ~/.Xmodmap
ln -s ~/dotfiles/gitconfig ~/.gitconfig
mkdir -p ~/.oh-my-zsh/custom/themes
cp ~/dotfiles/cpjr.zsh-theme ~/.oh-my-zsh/custom/themes
