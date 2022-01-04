# Kiosk installation script for Raspberry Pi
This script can be used for customizing **Raspberry Pi OS Lite** to be used as kiosk even without mouse or keyboard. If your webpage requires login you can use chromium addon called [Auto Login](https://chrome.google.com/webstore/detail/auto-login/kjdgohfkopafhjmmlbojhaabfpndllgk).

## How to install Raspberry Pi OS (Raspbian)

### Flash image to MicroSD card
You can use official Raspberry software called rpi-imager, dd command or any other (Rufus, ...).

#### rpi-imager
1. Insert MicroSD card to your computer
2. Select operating system - Raspbery Pi OS Lite (32-bit)
3. Select storage - Your MicroSD card
4. Write image

#### dd
1. Insert MicroSD card to your computer
2. Open terminal and then copy and modify this command `sudo dd bs=4M if=<image-location> of=/dev/<device (for example: sde)>`

### Resize rootfs partition
1. Open software called gparted (or any other) and in the menubar on top on the right side dropdown select the MicroSD card
2. Right click the second partition with label rootfs and select **Resize/Move**
3. Drag the right arrow to the end of the bar or enter the **Maximum size** value to **New size**
4. Click on **Resize/Move** button
5. Click on checkmark or go to edit **Edit** and then **Apply All Operations** to apply changes

### Enable ssh
1. Open terminal in **boot** partition of the MicroSD card
2. Type `touch ssh` to create file called ssh, this automatically enables ssh

### Remove MicroSD card from computer and insert it into Raspberry Pi

## How to run kiosk install script
1. Ssh to raspberry devide using ssh command `ssh pi@<ip-address>`, the defauld password is `raspberry`, and type `yes` to accept fingerprint
2. Execute `passwd` to change default password
3. Install git `sudo apt install -y git`
4. Clone **raspbian-kiosk** repository with `git clone https://github.com/Vofy/raspbian-kiosk.git`
5. Change directory to ~/raspbian-kiosk `cd raspbian-kiosk`
6. Now is great time to modify scripts (change plymouth splash screen image, change chromium url, ...)
7. And finally, we are ready to execute last step - running the script `sh install.sh`
