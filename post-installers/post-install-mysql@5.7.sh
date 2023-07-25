#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Adding $1 to PATH..."
echo 'export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"' >> ~/.zshrc
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

echo "Starting $1..."
brew services start $1

echo "Performing secure installation..."
echo "!!! The current password should be empty, but please check the output above !!!"
mysql_secure_installation