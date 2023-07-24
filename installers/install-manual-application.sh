#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

read -p "$1 needs to be installed or updated manually. Do you want to open the browser to install/update it? (y/n): " -n 1 -r INSTALL_MANUAL_APPLICATION
echo

if [[ $INSTALL_MANUAL_APPLICATION =~ ^[Yy]$ ]]; then
    echo "Opening browser with url $2..."
    open "$2"

    read -p "When you have successfully installed or updated $1, press the return key: " -r INSTALL_MANUAL_APPLICATION_COMPLETE
    echo

    runPostInstall "$1"
    runPostUpdate "$1"
fi