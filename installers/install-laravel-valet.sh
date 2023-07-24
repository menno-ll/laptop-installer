#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -d "$HOME/.config/valet" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_LARAVEL_VALET
    echo

    if [[ $INSTALL_LARAVEL_VALET =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        composer global require laravel/valet
        valet install

        runPostInstall "$1"
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_LARAVEL_VALET
    echo

    if [[ $UPDATE_LARAVEL_VALET =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        composer global require laravel/valet
        valet install
        
        runPostUpdate "$1"
    fi
fi