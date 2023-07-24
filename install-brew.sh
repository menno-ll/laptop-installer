#!/bin/bash -x

generateNotificationBanner "Checking your installation of Brew..."

if [ ! -x "$(command -v brew)" ]; then
    read -p "Brew is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_BREW
    echo

    if [[ $INSTALL_BREW =~ ^[Yy]$ ]]; then
        echo "Installing Brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

        runPostInstall "$1"
    fi
else
    read -p "Brew is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_BREW
    echo

    if [[ $UPDATE_BREW =~ ^[Yy]$ ]]; then
        echo "Updating Brew..."
        brew update
        
        runPostUpdate "$1"
    fi
fi