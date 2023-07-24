#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Enable settings sync in VS Code by going to Code -> Settings... -> Settings Sync. 
read -p "When you have successfully enabled settings sync, press the return key: " -r VISUAL_STUDIO_CODE_SETTINGS_SYNC_CONFIGURED
echo

