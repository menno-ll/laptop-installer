#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if [ ! -x "$(command -v xcode-select)" ]; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_XCODE_SELECT
    echo

    if [[ $INSTALL_XCODE_SELECT =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        xcode-select --install

        runPostInstall "$1"

        echo "$1 needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_XCODE_SELECT
    echo

    if [[ $UPDATE_XCODE_SELECT =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        echo "To update $1, it will first be deleted and then reinstalled."
        sudo rm -rf /Library/Developer/CommandLineTools
        xcode-select --install

        runPostUpdate "$1"

        echo $1 needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
fi