#!/bin/bash

input_check=0

while [ $input_check -eq 0 ]
do
    echo "1.Arch               2.Fedora"
    echo -n "Choose your distribution: "
    read choice

    if [[ $choice -eq 1  ]]
    then
        sudo pacman -S vim
        sudo pacman -S git
        sudo pacman -S cmake
        sudo pacman -S nodejs npm
        input_check=1
    elif [[ $choice -eq 2 ]]
    then
        sudo dnf install vim
        sudo dnf install git
        sudo dnf install cmake
        sudo dnf install nodejs
        input_check=1
    else
        echo "Invalid Input!! Try Again!!!"
        echo " "
        input_check=0
    fi
done

clear
echo "Setting up Vim..."
sleep 3
cp vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
mkdir ~/.vim/templates
cp Templates/skeleton.c ~/.vim/templates/skeleton.c
cp Templates/skeleton.cpp ~/.vim/templates/skeleton.cpp
cp Templates/skeleton.sh ~/.vim/templates/skeleton.sh
vim
clear
