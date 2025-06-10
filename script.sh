#!/bin/bash

echo "Hi!.. Welcome to our package management services!"
sleep 2
echo "What do you want to do today?"
sleep 2
echo "Do you want to install a package or remove it?"
sleep 2

read -n 2 -p "To install, press I. To remove, press R :" prompt1
prompt="${prompt1^^}"
echo -e "\n You entered: $prompt"

if [[ "$prompt" == "I" || "$prompt" == "R" ]]; then
    read -p "Type the package name: " pkg
    if [ "$pkg" == "" ]; then
    echo " Bhagggg..."
    exit
    else
    sleep 1
    echo "You entered: $pkg"
    sleep 2
    fi

    if [[ "$prompt" == "I" ]]; then
        echo "Installing $pkg..."
        sleep 2
        sudo apt install "$pkg"
        echo "$pkg installation complete. Exit code : $?"
    elif [[ "$prompt" == "R" ]]; then
        echo "Removing $pkg..."
        sleep 2
        sudo apt purge "$pkg"
        echo "$pkg removal complete. Exit code : $?"
    fi
else
    echo "Bhaggg...."
fi
