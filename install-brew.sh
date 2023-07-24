#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -x "$(command -v brew)" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_BREW
    echo

    if [[ $INSTALL_BREW =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

        runPostInstall "$1"
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_BREW
    echo

    if [[ $UPDATE_BREW =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        brew update
        
        runPostUpdate "$1"
    fi
fi