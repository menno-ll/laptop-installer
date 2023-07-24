#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

if ! brew info $1 &>/dev/null; then
    read -p "$1 is not installed. Do you want to install it? (y/n): " -n 1 -r INSTALL_CASK
    echo

    if [[ $INSTALL_CASK =~ ^[Yy]$ ]]; then
        echo "Installing $1..."
        brew install --cask $1
    fi
else
    read -p "$1 is already installed. Do you want to update it? (y/n): " -n 1 -r UPDATE_CASK
    echo

    if [[ $UPDATE_CASK =~ ^[Yy]$ ]]; then
        echo "Updating $1..."
        brew upgrade --cask $1
    fi
fi