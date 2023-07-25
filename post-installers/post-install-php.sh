#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Adding Brew tap shivammathur/php for old PHP versions"
brew tap shivammathur/php