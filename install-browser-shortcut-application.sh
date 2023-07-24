#!/bin/bash -x

generateNotificationBanner "Checking your installation of $1..."

read -p "$1 needs to be installed manually as a browser shortcut. Do you want to open the browser to install it as a shortcut manually? (y/n): " -n 1 -r INSTALL_BROWSER_SHORTCUT_APPLICATION
echo

if [[ $INSTALL_BROWSER_SHORTCUT_APPLICATION =~ ^[Yy]$ ]]; then
    echo "Go to the 3 dots menu > More tools > Create shortcut..."
    echo "Make sure to enable \"Open as new window\""

    echo "Opening browser with url $2..."
    open "$2"

    read -p "When you have successfully installed $1, press the return key: " -r INSTALL_BROWSER_SHORTCUT_APPLICATION_COMPLETE
    echo
fi