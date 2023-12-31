#!/bin/bash -x

generateNotificationBanner "Running post-install script of $1..."

echo "Copying WordPress driver..."
cp "$SCRIPT_DIRECTORY/data/laravel-valet/WordPressValetDriver.php" "$HOME/.config/valet/Drivers/WordPressValetDriver.php"

echo "Parking..."
read -p "Enter the Valet sites root directory path (from the root, including the root /):" -r VALET_SITE_PATH
echo
if [ ! -d "$VALET_SITE_PATH" ]; then
    read -p "The path $VALET_SITE_PATH does not exist. Do you want to create it? (y/n): " -n 1 -r VALET_SITE_PATH_CREATE
    echo

    if [[ $VALET_SITE_PATH_CREATE =~ ^[Yy]$ ]]; then
        echo "Creating $VALET_SITE_PATH..."
        mkdir -p "$VALET_SITE_PATH"
    else
        echo "You need a valid Valet site path to continue. Exiting..."
        exit
    fi
fi

if [ ! -x "$(command -v valet)" ]; then
    echo 'Valet command is not available, adding Composer bin to PATH in an attempt to fix it.';
    export PATH="$PATH:$HOME/.composer/vendor/bin"
fi

if [ ! -x "$(command -v valet)" ]; then
    echo "laravel Valet cannot park automatically. Please open a new terminal tab and run the following command to park Laravel Valet:";
    echo '```'
    echo "cd \"$VALET_SITE_PATH\""
    echo "valet park"
    echo '```'
    read -p "When you have successfully parked $1, press the return key: " -r LARAVEL_PARK_COMMAND_COMPLETE
    echo
else
    cd "$VALET_SITE_PATH"
    valet park
    cd "$SCRIPT_DIRECTORY"
fi
