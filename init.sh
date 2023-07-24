#!/bin/bash -x

# Load functions
source "helper-message.sh"
source "helper-install.sh"

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
source "install-xcode-select.sh" "xcode-select"
source "install-zsh.sh" "zsh"
source "install-oh-my-zsh.sh" "oh-my-zsh"
source "install-nvm.sh" "nvm"

# Install CLI tools
source "install-brew-formula.sh" "wget"
source "install-brew-formula.sh" "php"
source "install-brew-formula.sh" "perl"
source "install-brew-formula.sh" "composer"
source "install-brew-formula.sh" "mysql@5.7"
source "install-brew-formula.sh" "qcachegrind"
source "install-brew-formula.sh" "jq"
source "install-brew-formula.sh" "yq"
source "install-brew-formula.sh" "wp-cli"
source "install-brew-formula.sh" "thefuck"

# Install applications
source "install-brew-cask.sh" "1password"
source "install-brew-cask.sh" "adobe-acrobat-reader"
source "install-brew-cask.sh" "android-studio"
source "install-brew-cask.sh" "bitwarden"
source "install-brew-cask.sh" "browserstacklocal"
source "install-brew-cask.sh" "dash"
source "install-brew-cask.sh" "discord"
source "install-brew-cask.sh" "docker"
source "install-brew-cask.sh" "firefox"
source "install-brew-cask.sh" "google-chrome"
source "install-brew-cask.sh" "handbrake"
source "install-brew-cask.sh" "obs"
source "install-brew-cask.sh" "poedit"
source "install-brew-cask.sh" "postman"
source "install-brew-cask.sh" "rectangle"
source "install-brew-cask.sh" "sequel-ace"
source "install-brew-cask.sh" "slack"
source "install-brew-cask.sh" "soapui"
source "install-brew-cask.sh" "spotify"
source "install-brew-cask.sh" "teamviewer"
source "install-brew-cask.sh" "the-unarchiver"
source "install-brew-cask.sh" "tunnelblick"
source "install-brew-cask.sh" "vagrant"
source "install-brew-cask.sh" "virtualbox"
source "install-brew-cask.sh" "visual-studio-code"
source "install-brew-cask.sh" "vlc"
source "install-brew-cask.sh" "yubico-authenticator"
source "install-brew-cask.sh" "zoom"

# Install App Sore Applications
source "install-app-store-application.sh" "harvest" "https://apps.apple.com/us/app/harvest/id506189836"
source "install-app-store-application.sh" "keynote" "https://apps.apple.com/us/app/keynote/id409183694"
source "install-app-store-application.sh" "lightshot" "https://apps.apple.com/us/app/lightshot-screenshot/id526298438"
source "install-app-store-application.sh" "numbers" "https://apps.apple.com/us/app/numbers/id409203825"
source "install-app-store-application.sh" "pages" "https://apps.apple.com/us/app/pages/id409201541"
source "install-app-store-application.sh" "xcode" "https://apps.apple.com/us/app/xcode/id497799835"

# Install manual applications
source "install-manual-application.sh" "android-file-transfer" "https://www.android.com/filetransfer/"

# Install browser shortcut applications
source "install-browser-shortcut-application.sh" "google-calendar" "https://calendar.google.com/"
source "install-browser-shortcut-application.sh" "google-keep" "https://keep.google.com/"
source "install-browser-shortcut-application.sh" "voys" "https://webphone.voys.nl/"

# Install Laravel Valet
source "install-laravel-valet.sh" "laravel-valet"

generateGoodbyeMessage