#!/bin/bash -x

function generateWarningBanner {
	echo
	echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
	echo "$1"
	echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
	echo
}

function generateStatusBanner {
	echo
	echo '------------------------------------------------------------------'
	echo "$1"
	echo '------------------------------------------------------------------'
	echo
}

function generateNotificationBanner {
	echo
	echo '******************************************************************'
	echo "$1"
	echo '******************************************************************'
	echo
}

function generateWelcomeMessage {
	echo
	echo '##################################################################'
	echo '##################################################################'
	echo '##     ######                                                   ##'
	echo '##  #########  Level Level - https://level-level.com            ##'
	echo '#############  New laptop install script                        ##'
	echo '#########  ##  Created by Menno van den Ende                    ##'
	echo '######     ##                                                   ##'
	echo '##################################################################'
	echo '##################################################################'
	echo
}

function generateGoodbyeMessage {
	echo
	echo '##################################################################'
	echo '##################################################################'
	echo '##     ######                                                   ##'
	echo '##  #########  Laptop installed.                                ##'
	echo '#############                                                   ##'
	echo '#########  ##  Please restart your laptop to apply all changes  ##'
	echo '######     ##                                                   ##'
	echo '##################################################################'
	echo '##################################################################'
	echo
}
