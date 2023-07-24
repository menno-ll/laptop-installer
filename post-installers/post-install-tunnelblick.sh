#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Please upload your VPN profiles."
read -p "When you have successfully uploaded your profiles, press the return key: " -r TUNNELBLICK_PROFILES_CONFIGURED
echo

