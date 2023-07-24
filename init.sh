#!/bin/bash -x

# Load functions
source "generate-message.sh"

generateWelcomeMessage

# Setup homebrew
source "install-brew.sh"

# Setup terminal
source "install-zsh.sh"
source "install-oh-my-zsh.sh"

# Install applications
source "install-cask.sh" "slack"
source "install-cask.sh" "firefox"
source "install-cask.sh" "google-chrome"
source "install-cask.sh" "rectangle"
source "install-cask.sh" "spotify"

generateGoodbyeMessage