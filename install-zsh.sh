#!/bin/bash -x

generateNotificationBanner "Checking your installation of ZSH..."

if [ ! -x "$(command -v zsh)" ]; then
    read -p "ZSH is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_ZSH
    echo

    if [[ $INSTALL_ZSH =~ ^[Yy]$ ]]; then
        echo "Installing ZSH..."
        brew install zsh

        runPostInstall "$1"

        echo "ZSH needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "ZSH is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_ZSH
    echo
    
    if [[ $UPDATE_ZSH =~ ^[Yy]$ ]]; then
        echo "Updating ZSH..."

        if ! brew ls --versions zsh &>/dev/null; then
            # Not installed via brew
            echo "Cannot update via brew. Please update manually."
        else
            # Installed via brew
            brew upgrade zsh
        fi

        runPostUpdate "$1"
    fi
fi