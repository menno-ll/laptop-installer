#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

read -p "$1 needs to be installed with the App Store. Do you want to open the app store? (y/n): " -n 1 -r INSTALL_APP_STORE_APPLICATION
echo

if [[ $INSTALL_APP_STORE_APPLICATION =~ ^[Yy]$ ]]; then
    echo "Opening app store with url $2..."
    open "$2"
fi