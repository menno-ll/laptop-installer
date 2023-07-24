#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Adding $1 to PATH..."
echo 'eval $(thefuck --alias)' >> ~/.zshrc
eval $(thefuck --alias)