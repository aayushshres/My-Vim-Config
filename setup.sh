#!/bin/bash

linux_setup(){    # vimrc setup for Linux
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
}

macos_setup(){    # vimrc setup for MacOS
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
}

input_check=0
brew_check=0
brewInstall_check=0

echo "Please go through the Setup Process!"
sleep 2

# Checking Operating System
while [ $input_check -eq 0 ]
do
    echo "1.Arch    2.Fedora     3.Debian     4.MacOS"
    echo -n "Enter your choice: "
    read osChoice

    if [[ $osChoice -eq 1  ]]   # For Arch Linux
    then
        sudo pacman -S vim
        sudo pacman -S git
        sudo pacman -S cmake
        sudo pacman -S nodejs npm
        linux_setup
        input_check=1
    elif [[ $osChoice -eq 2 ]]   # For Fedora
    then
        sudo dnf install vim
        sudo dnf install git
        sudo dnf install cmake
        sudo dnf install nodejs
        linux_setup
        input_check=1
    
    elif [[ $osChoice -eq 3 ]] # For Debian
    then
        sudo apt install vim
        sudo apt install git
        sudo apt install cmake
        sudo dnf install nodejs && npm
        linux_setup
        input_check=1

    elif [[ $osChoice -eq 4 ]]   # For MacOS
    then
        echo "Make sure you have Homebrew Installed!!"
        echo "1. Yes I have Installed Homebrew"
        echo "2. No I have not Installed Homebrew"
        echo -n "Enter your choice: "
        read brew_choice

        while [ brew_check -eq 0]
        do
            if [[ $brew_choice -eq 1 ]]
            then
                continue
                brew_check=1
            elif [[ $brew_choice -eq 2 ]]
            then
                echo "1.If you want this script to install Homebrew to your system"
                echo "2. If you want to install Homebrew manually"
                echo -n "Enter your choice: "
                read brewinstall_choice

                while [ brewInstall_check -eq 0 ]
                do
                    if [[ $brewinstall_choice -eq 1 ]]
                    then
                        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                        brewInstall_check=1
                    elif [[ $brewinstall_choice -eq 2 ]]
                    then
                        break
                        brewInstall_check=1
                    else
                        echo "Invalid Input!! Try Again!!!"
                        echo " "
                        brewInstall_check=0
                    fi
                done

                brew_check=1
            else
                echo "Invalid Input!! Try Again!!!"
                echo " "
                brew_check=0
            fi
        done
        brew install cmake
        brew install node
        macos_setup
    else
        echo "Invalid Input!! Try Again!!!"
        echo " "
        input_check=0
    fi
done

clear
