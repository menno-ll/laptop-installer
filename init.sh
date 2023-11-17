#!/bin/bash -x

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load functions
source "$SCRIPT_DIRECTORY/helpers/helper-message.sh"
source "$SCRIPT_DIRECTORY/helpers/helper-install.sh"

generateWelcomeMessage

read -p "Does terminal have app management permissions? You can check this by going to System Settings > Privacy & Security > App Management and verifying terminal is present and enabled. (y/n): " -n 1 -r TERMINAL_HAS_APP_MANAGEMENT_PERMISSIONS
echo

if [[ ! $TERMINAL_HAS_APP_MANAGEMENT_PERMISSIONS =~ ^[Yy]$ ]]; then
    echo "Go to System Settings > Privacy & Security > App Management and add or enable the Terminal app. Then restart the terminal."
    exit
fi

# Setup homebrew
source "$SCRIPT_DIRECTORY/installers/install-brew.sh" "brew"

# Setup terminal
source "$SCRIPT_DIRECTORY/installers/install-xcode-select.sh" "xcode-select"
source "$SCRIPT_DIRECTORY/installers/install-zsh.sh" "zsh"
source "$SCRIPT_DIRECTORY/installers/install-oh-my-zsh.sh" "oh-my-zsh"
source "$SCRIPT_DIRECTORY/installers/install-nvm.sh" "nvm"

# Install brew CLI tools
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "wget"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "php"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "perl"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "composer"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "mysql@5.7"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "qcachegrind"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "jq"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "yq"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "wp-cli"
source "$SCRIPT_DIRECTORY/installers/install-brew-formula.sh" "thefuck"

# Install brew cask applications
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "1password"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "adobe-acrobat-reader"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "android-studio"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "bitwarden"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "browserstacklocal"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "dash"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "discord"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "docker"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "firefox"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "google-chrome"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "handbrake"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "obs"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "poedit"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "postman"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "rectangle"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "screaming-frog-seo-spider"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "sequel-ace"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "slack"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "soapui"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "spotify"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "teamviewer"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "the-unarchiver"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "tunnelblick"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "vagrant"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "virtualbox"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "visual-studio-code"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "vlc"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "yubico-authenticator"
source "$SCRIPT_DIRECTORY/installers/install-brew-cask.sh" "zoom"

# Install App Store applications
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "harvest" "https://apps.apple.com/us/app/harvest/id506189836"
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "keynote" "https://apps.apple.com/us/app/keynote/id409183694"
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "lightshot" "https://apps.apple.com/us/app/lightshot-screenshot/id526298438"
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "numbers" "https://apps.apple.com/us/app/numbers/id409203825"
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "pages" "https://apps.apple.com/us/app/pages/id409201541"
source "$SCRIPT_DIRECTORY/installers/install-app-store-application.sh" "xcode" "https://apps.apple.com/us/app/xcode/id497799835"

# Install manual applications
source "$SCRIPT_DIRECTORY/installers/install-manual-application.sh" "android-file-transfer" "https://www.android.com/filetransfer/"

# Install browser shortcut applications
source "$SCRIPT_DIRECTORY/installers/install-browser-shortcut-application.sh" "google-calendar" "https://calendar.google.com/"
source "$SCRIPT_DIRECTORY/installers/install-browser-shortcut-application.sh" "google-keep" "https://keep.google.com/"
source "$SCRIPT_DIRECTORY/installers/install-browser-shortcut-application.sh" "voys" "https://webphone.voys.nl/"

# Install Laravel Valet
source "$SCRIPT_DIRECTORY/installers/install-laravel-valet.sh" "laravel-valet"

# Update settings
source "$SCRIPT_DIRECTORY/settings/settings-osx.sh" "osx"

generateGoodbyeMessage
