#!/bin/bash -x

function runPostInstall {
	local POST_INSTALL_SCRIPT="$SCRIPT_DIRECTORY/post-installers/post-install-$1.sh"
	if [ -f "${POST_INSTALL_SCRIPT}" ]; then
		echo "Running post install script for $1..."
		source "${POST_INSTALL_SCRIPT}" "$1"
	fi
}

function runPostUpdate {
	local POST_UPDATE_SCRIPT="$SCRIPT_DIRECTORY/post-updaters/post-update-$1.sh"
	if [ -f "${POST_UPDATE_SCRIPT}" ]; then
		echo "Running post update script for $1..."
		source "${POST_UPDATE_SCRIPT}" "$1"
	fi
}