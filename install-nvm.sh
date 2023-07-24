#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ "$(type -t nvm)" != "function" ]; then
    # NVM is not always loaded. Attempt to load it if it's not defined
    if [ -f "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi
fi

if [ "$(type -t nvm)" != "function" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_NVM
    echo

    if [[ $INSTALL_NVM =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

        runPostInstall "$1"
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_NVM
    echo
    
    if [[ $UPDATE_NVM =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

        runPostUpdate "$1"
    fi
fi