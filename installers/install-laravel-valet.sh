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
            VALET_POST_INSTALL_SCRIPT="$SCRIPT_DIRECTORY/post-installers/post-install-$1.sh"
            osascript -e "
            tell application \"Terminal\"
                set currentTab to do script \"valet install\"
                do script \"sh $VALET_POST_INSTALL_SCRIPT $1\" in currentTab
                do script \"echo 'Valet post install script has been completed. You may close this terminal tab.'\" in currentTab
            end tell"
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