#!/bin/bash -x

# Load functions
source "generate-message.sh"

generateWelcomeMessage

read -p "Does terminal have app management permissions? You can check this by going to System Settings > Privacy & Security > App Management and verifying terminal is enabled. (y/n): " -n 1 -r TERMINAL_HAS_APP_MANAGEMENT_PERMISSIONS
echo

if [[ ! $TERMINAL_HAS_APP_MANAGEMENT_PERMISSIONS =~ ^[Yy]$ ]]; then
    echo "Go to System Settings > Privacy & Security > App Management and add or enable your terminal. Then restart the terminal."
    exit
fi

# Setup homebrew
source "install-brew.sh"

# Setup terminal
source "install-zsh.sh"
source "install-oh-my-zsh.sh"

# Install applications
source "install-brew-cask.sh" "slack"
source "install-brew-cask.sh" "firefox"
source "install-brew-cask.sh" "google-chrome"
source "install-brew-cask.sh" "rectangle"
source "install-brew-cask.sh" "spotify"
source "install-brew-cask.sh" "visual-studio-code"
source "install-brew-cask.sh" "dash"
source "install-brew-cask.sh" "docker"
source "install-brew-cask.sh" "poedit"
source "install-brew-cask.sh" "sequel-ace"
source "install-brew-cask.sh" "virtualbox"
source "install-brew-cask.sh" "vagrant"
source "install-brew-cask.sh" "soapui"
source "install-brew-cask.sh" "yubico-authenticator"
source "install-brew-cask.sh" "1password"
source "install-brew-cask.sh" "handbrake"
source "install-brew-cask.sh" "android-studio"
source "install-brew-cask.sh" "teamviewer"
source "install-brew-cask.sh" "postman"
source "install-brew-cask.sh" "vlc"
source "install-brew-cask.sh" "the-unarchiver"
source "install-brew-cask.sh" "tunnelblick"
source "install-brew-cask.sh" "browserstacklocal"
source "install-brew-cask.sh" "discord"
source "install-brew-cask.sh" "bitwarden"
source "install-brew-cask.sh" "browserstacklocal"
source "install-brew-cask.sh" "zoom"
source "install-brew-cask.sh" "obs"
source "install-brew-cask.sh" "adobe-acrobat-reader"

# Install App Sore Applications
source "install-app-store-application.sh" "Harvest" "https://apps.apple.com/us/app/harvest/id506189836"
source "install-app-store-application.sh" "Lightshot" "https://apps.apple.com/us/app/lightshot-screenshot/id526298438"
source "install-app-store-application.sh" "Keynote" "https://apps.apple.com/us/app/keynote/id409183694"
source "install-app-store-application.sh" "Numbers" "https://apps.apple.com/us/app/numbers/id409203825"
source "install-app-store-application.sh" "Pages" "https://apps.apple.com/us/app/pages/id409201541"
source "install-app-store-application.sh" "XCode" "https://apps.apple.com/us/app/xcode/id497799835"

# Install manual applications
source "install-manual-application.sh" "Android File Transfer" "https://www.android.com/filetransfer/"

# Install browser shortcut applications
source "install-browser-shortcut-application.sh" "Voys" "https://webphone.voys.nl/"
source "install-browser-shortcut-application.sh" "Google Calendar" "https://calendar.google.com/"
source "install-browser-shortcut-application.sh" "Google Keep" "https://keep.google.com/"

generateGoodbyeMessage