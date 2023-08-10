#!/bin/bash -x

# With inspiration from: https://github.com/mathiasbynens/dotfiles/blob/main/.macos

generateNotificationBanner "Restoring settings of $1..."

read -p "Do you want to restore the settings of $1? (y/n): " -n 1 -r SETTINGS_OSX
echo

if [[ $SETTINGS_OSX =~ ^[Yy]$ ]]; then
    echo "Closing System preferences..."
    osascript -e 'tell application "System Preferences" to quit'

    ###############################################################################
    # General UI/UX                                                               #
    ###############################################################################
    echo "Setting general UI/UX settings...";

    # Always show scrollbars
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
    # Possible values: `WhenScrolling`, `Automatic` and `Always`

    # Disable automatic capitalization as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

    # Disable smart dashes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

    # Disable automatic period substitution as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

    # Disable smart quotes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

    # Disable auto-correct
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

    # Trackpad: enable tap to click for this user and for the login screen
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    # defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Trackpad: map bottom right corner to right-click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
    # defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
    defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
    # defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

    # Set a blazingly fast keyboard repeat rate
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 25

    # Set language and text formats
    defaults write NSGlobalDomain AppleLanguages -array "en-NL" "nl-NL"
    defaults write NSGlobalDomain AppleLocale -string "en_NL"
    defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
    defaults write NSGlobalDomain AppleMetricUnits -bool true
    defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
    defaults write NSGlobalDomain AppleFirstWeekday -dict 'gregorian' 2
    defaults write NSGlobalDomain AppleICUDateFormatStrings -dict '1' 'y-MM-dd'
    defaults write NSGlobalDomain AppleICUNumberSymbols -dict 0 '.' 1 ',' 10 '.' 17 ','

    # Set the timezone; see `sudo systemsetup -listtimezones` for other values
    sudo systemsetup -settimezone "Europe/Amsterdam" 2> /dev/null

    ###############################################################################
    # Finder                                                                      #
    ###############################################################################
    echo "Setting Finder settings...";

    # Show icons for hard drives, servers, and removable media on the desktop
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    # Finder: show all filename extensions
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Finder: show path bar
    defaults write com.apple.finder ShowPathbar -bool true

    # When performing a search, search the current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    # Remove Trash items after 30 days.
    defaults write com.apple.finder FXRemoveOldTrashItems -bool true

    killall Finder

    ###############################################################################
    # Dock, Dashboard, and hot corners                                            #
    ###############################################################################
    echo "Setting Dock, Dashboard, and hot corners settings...";

    # Automatically hide and show the Dock
    defaults write com.apple.dock autohide -bool true

    # Don’t show recent applications in Dock
    defaults write com.apple.dock show-recents -bool false

    killall Dock
fi