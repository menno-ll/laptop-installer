#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Enable settings sync in VS Code by going to Code -> Settings... -> Settings Sync."
read -p "When you have successfully enabled settings sync, press the return key: " -r VISUAL_STUDIO_CODE_SETTINGS_SYNC_CONFIGURED
echo

echo "Enable the code command. Open the Command Palette (Cmd+Shift+P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command."
read -p "When you have successfully installed the code shell command, press the return key: " -r VISUAL_STUDIO_CODE_SETTINGS_SYNC_CONFIGURED
echo