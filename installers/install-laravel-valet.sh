#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -d "$HOME/.config/valet" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_LARAVEL_VALET
    echo

    if [[ $INSTALL_LARAVEL_VALET =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        composer global require laravel/valet

        if [ ! -x "$(command -v valet)" ]; then
            echo 'Valet command is not available, adding Composer bin to PATH in an attempt to fix it.';
            export PATH="$PATH:$HOME/.composer/vendor/bin"
        fi

        if [ ! -x "$(command -v valet)" ]; then
            echo "laravel Valet cannot be installed automatically. Please open a new terminal tab and run the following commands to install Laravel Valet:";
            echo '```'
            echo "valet install"
            echo '```'
            read -p "When you have successfully installed $1, press the return key: " -r LARAVEL_INSTALL_COMMAND_COMPLETE
            echo
        else
            valet install
            runPostInstall "$1"
        fi
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