#!/bin/bash

if [ -f /etc/debian_version ]; then
    echo "Distro: Debian"
    sudo apt update
    sudo apt install macchanger net-tools python3-venv
elif [ -f /etc/redhat-release ]; then
    echo "Distro: Red Hat / CentOS / Fedora"
    sudo yum install epel-release
    sudo yum install macchanger
    sudo dnf install macchanger net-tools python3-venv
elif [ -f /etc/arch-release ]; then
    echo "Distro: Arch Linux"
    sudo pacman -Sy macchanger net-tools python3
else
    echo "Distro not detect!"
fi

COMMANDS=("macchanger" "ifconfig")

for COMMAND in "${COMMANDS[@]}"; do
    if command -v "$COMMAND" &> /dev/null; then
        echo "$COMMAND komutu mevcut."
    else
        echo "$COMMAND komutu mevcut değil."
        if [ "$COMMAND" = "macchanger" ]; then
            echo "Please manuel install macchanger"
        elif [ "$COMMAND" = "ifconfig" ]; then
            echo "Please manuel install net-tools"
        fi
        exit
    fi
done

sudo mkdir /usr/share/mac_anonymizer
sudo cp mac_anonymizer.py /usr/share/mac_anonymizer
sudo mv mac_anonymizer.service /etc/systemd/system/
sudo mv mac_anonymizer.timer /etc/systemd/system/
sudo python3 -m venv /usr/share/mac_anonymizer/python_env
sudo /usr/share/mac_anonymizer/python_env/bin/pip3 install psutil
sudo systemctl daemon-reload
sudo systemctl enable --now mac_anonymizer.service
sudo systemctl enable --now mac_anonymizer.timer