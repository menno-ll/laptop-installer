#!/bin/bash -x

generateNotificationBanner "Checking your installation of NVM..."

if [ "$(type -t nvm)" != "function" ]; then
    # NVM is not always loaded. Attempt to load it if it's not defined
    if [ -f "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi
fi

if [ "$(type -t nvm)" != "function" ]; then
    read -p "NVM is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_NVM
    echo

    if [[ $INSTALL_NVM =~ ^[Yy]$ ]]; then
        echo "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

        export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

        runPostInstall "$1"
    fi
else
    read -p "NVM is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_NVM
    echo
    
    if [[ $UPDATE_NVM =~ ^[Yy]$ ]]; then
        echo "Updating NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

        runPostUpdate "$1"
    fi
fi