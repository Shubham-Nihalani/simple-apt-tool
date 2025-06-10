#!/bin/bash

echo "Hi!.. Welcome to our package management services!"
sleep 2
echo "What do you want to do today?"
sleep 2
echo "Do you want to install a package or remove it?"
sleep 2

read -p "To install, press I. To remove, press R :" prompt1
prompt="${prompt1:0:1}"   # take FIRST character
prompt="${prompt^^}"    # convert it to uppercase
echo "You entered: $prompt"
# nested if-else to check prompts

if [[ "$prompt" == "I" || "$prompt" == "R" ]]; then
    read -p "Type the package name: " pkg
	# Checks if provided a package or not
    if [ -z "$pkg" ]; then
    echo "Bhagggg..."
    exit
    else
    sleep 1
    echo "You entered: $pkg"
    sleep 2
    fi

	# another if-else to install or remove packages

    if [[ "$prompt" == "I" ]]; then
        echo "Installing $pkg..."
        sleep 2
		# added log file support
        sudo apt install "$pkg" -y >> ~/install_log.txt 2>&1
		# another if-else to check whether the installation is successful or not
        if [[ $? == 0 ]]; then
        echo "$pkg removal complete. Exit code : $?"
        else
        echo -e "$pkg installation unsuccessful.\nCheck ~/install_log.txt for more details.\nExit code : $?"
        fi
    elif [[ "$prompt" == "R" ]]; then
        echo "Removing $pkg..."
        sleep 2
        # added log file support
        sudo apt purge "$pkg" -y >> ~/remove_log.txt 2>&1
		# another if-else to check whether the removal is successful or not
		if [[ $? == 0 ]]; then
        echo "$pkg removal complete. Exit code : $?"
        else
        echo -e "$pkg removal unsuccessful.\nCheck ~/remove_log.txt for more details.\nExit code : $?"
        fi
    fi
else
    echo "Bhaggg...."
	# case of invalud condition
fi
