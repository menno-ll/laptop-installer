#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_OMZ
    echo

    if [[ $INSTALL_OMZ =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        runPostInstall "$1"

        echo "$1 needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_OMZ
    echo
    
    if [[ $UPDATE_OMZ =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        sh "$ZSH/tools/upgrade.sh"

        runPostUpdate "$1"
    fi
fi