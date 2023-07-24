#!/bin/bash -x

function runPostInstall {
	local POST_INSTALL_SCRIPT = "post-install-$1.sh"
	if [ -f "${POST_INSTALL_SCRIPT}" ]; then
		echo "Running post install script for $1..."
		source "${POST_INSTALL_SCRIPT}" "$1"
	fi
}

function runPostUpdate {
	local POST_UPDATE_SCRIPT = "post-install-$1.sh"
	if [ -f "${POST_UPDATE_SCRIPT}" ]; then
		echo "Running post install script for $1..."
		source "${POST_INSTALL_SCRIPT}" "$1"
	fi
}