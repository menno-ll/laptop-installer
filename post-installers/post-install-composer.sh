#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Adding $1 to PATH..."
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.zshrc
export PATH="$PATH:$HOME/.composer/vendor/bin"