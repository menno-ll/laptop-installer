#!/bin/bash -x

generateNotificationBanner "Checking your installation of Xcode Command Line Tools..."

if [ ! -x "$(command -v xcode-select)" ]; then
    read -p "Xcode Command Line Tools is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_XCODE_SELECT
    echo

    if [[ $INSTALL_XCODE_SELECT =~ ^[Yy]$ ]]; then
        echo "Installing Xcode Command Line Tools..."
        xcode-select --install

        echo "Xcode command line tools needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
else
    read -p "Xcode Command Line Tools is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_XCODE_SELECT
    echo

    if [[ $UPDATE_XCODE_SELECT =~ ^[Yy]$ ]]; then
        echo "Updating Xcode Command Line Tools..."
        echo "To update XCode Command Line Tools, it will first be deleted and then reinstalled."
        sudo rm -rf /Library/Developer/CommandLineTools
        xcode-select --install

        echo "Xcode command line tools needs the terminal to reload for it to work. Please close and reopen the terminal, and then re-run this script.";
        exit
    fi
fi