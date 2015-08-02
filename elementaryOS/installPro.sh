#!/bin/bash

cd ~/
#First you update your system
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y upgrade

# install developer tools
# sudo apt-get install apache2 mysql-server mysql-client php5 phpmyadmin

# Install additional codecs to run all sorts of media
sudo apt-get -y install ubuntu-restricted-extras

# Install additional codecs to run of video media
sudo apt-get -y install flashplugin-installer

# install virtualbox-guest-additions
sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

mkdir Upgrade
cd ~/Upgrade

# Show listed all installed Packets on this System
cat /etc/apt/sources.list  > sources.save.list
cat /etc/apt/sources.list.d/*.list  >> sources.save.list
mv sources.save.list ~/sources.save.txt

# download guest additions iso
FILE="VBoxGuestAdditions_5.0.0.iso"
if [ ! -e $FILE ]; then
	wget -O $FILE http://download.virtualbox.org/virtualbox/5.0.0/$FILE
fi

sudo mkdir /mnt/VBGA/
sudo mount $FILE /mnt/VBGA/

cd /mnt/VBGA/
sudo ./VBoxLinuxAdditions.run

# get sharedFolder permissions
usermod -aG vboxsf $USER

# umound cd disc with guest additions
umount /mnt/VBGA/

sudo apt-get -y autoremove

sleep 5;
sudo shutdown -r now
# remove installer
rm -rf ~/installPro.sh
