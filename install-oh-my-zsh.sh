#!/bin/bash -x

generateNotificationBanner "Checking your installation of Oh My ZSH..."

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
    read -p "Oh My ZSH is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_OMZ
    echo

    if [[ $INSTALL_ZSH =~ ^[Yy]$ ]]; then
        echo "Installing Oh My ZSH..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        echo "Oh My ZSH needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "Oh My ZSH is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_OMZ
    echo
    
    if [[ $UPDATE_OMZ =~ ^[Yy]$ ]]; then
        echo "Updating Oh My ZSH..."
        sh "$ZSH/tools/upgrade.sh"
    fi
fi