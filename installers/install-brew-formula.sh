#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if ! brew list $1 &>/dev/null; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_BREW_FORMULA
    echo

    if [[ $INSTALL_BREW_FORMULA =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        brew install $1

        runPostInstall "$1"
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r INSTALL_BREW_FORMULA
    echo

    if [[ $INSTALL_BREW_FORMULA =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        brew upgrade $1

        runPostUpdate "$1"
    fi
fi