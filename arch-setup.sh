#!/bin/bash

sudo pacman -S vim
sudo pacman -S git
sudo pacman -S cmake
sudo pacman -S nodejs npm
cp vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/templates
cp Templates/skeleton.c ~/.vim/templates/skeleton.c
cp Templates/skeleton.cpp ~/.vim/templates/skeleton.cpp
cp Templates/skeleton.sh ~/.vim/templates/skeleton.sh
vim
clear

