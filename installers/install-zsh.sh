#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -x "$(command -v zsh)" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_ZSH
    echo

    if [[ $INSTALL_ZSH =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        brew install zsh

        runPostInstall "$1"

        echo "$1 needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_ZSH
    echo
    
    if [[ $UPDATE_ZSH =~ ^[Yy]$ ]]; then
        echo "Updating $1..."

        if ! brew ls --versions zsh &>/dev/null; then
            # Not installed via brew
            echo "Cannot update $1 via brew. Please update manually."
        else
            # Installed via brew
            brew upgrade zsh
        fi

        runPostUpdate "$1"
    fi
fi