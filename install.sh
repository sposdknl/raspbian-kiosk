#!/bin/bash

# Install updates
sudo apt update
sudo apt upgrade -y

# Install packages
sudo apt-get install --no-install-recommends --no-install-suggests -y unclutter sed chromium-browser console-data xserver-xorg xinit x11-xserver-utils rpd-plym-splash matchbox-window-manager

# Remove not required packages
sudo apt clean
sudo apt autoremove -y

# Copy config files
cp -f .xinitrc ~/
cp -f .bash_profile ~/
sudo cp -r plymouth-theme/spos /usr/share/plymouth/themes/

# Disable motd
touch ~/.hushlogin

# Get rid of "Wi-Fi is currently blocked by rfkill. Use raspi-config to set the country before use." message
sudo raspi-config nonint do_wifi_country CZ

# Apply theme
sudo plymouth-set-default-theme spos -R

# Disable rainbow image at boot
sudo sed -i "$ a\\\n# Disable rainbow image at boot\ndisable_splash=1\n\n# Disable bloutooth\ndtoverlay=disable-bt\n\n# Disable boot delay\nboot_delay=0" /boot/config.txt

# Disable cursor and raspberry logo
sudo sed -i '${s/$/ vt.global_cursor_default=0 logo.nologo/}' /boot/cmdline.txt

# Option to set czech locale
sudo dpkg-reconfigure locales

# Set czech keymap
sudo touch /etc/vconsole.conf
echo "KEYMAP=cz" | sudo tee /etc/vconsole.conf
sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'cz'\"/g' /etc/default/keyboard

# Set czech timezone
sudo timedatectl set-timezone Europe/Prague

# Enable plymouth splashscreen using raspi-config script
sudo raspi-config nonint do_boot_splash 0

# Enable autologin using raspi-config script
sudo raspi-config nonint do_boot_behaviour B2
sudo cp -f autologin.conf /etc/systemd/system/getty@tty1.service.d/

# Set hostname using raspi-config script
sudo raspi-config nonint do_hostname DM-141-VYCHOVATELNA-KAMERY

# Reboot system
sudo reboot
