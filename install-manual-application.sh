#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

read -p "$1 needs to be installed manually. Do you want to open the browser to install it? (y/n): " -n 1 -r INSTALL_MANUAL_APPLICATION
echo

if [[ $INSTALL_MANUAL_APPLICATION =~ ^[Yy]$ ]]; then
    echo "Opening browser with url $2..."
    open "$2"
fi