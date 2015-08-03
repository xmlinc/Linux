#!/bin/bash

cd ~/
# First you update your system
#sudo apt-get -y update

# Update all installed Programms, Kernel-Updates, Distributions-Updates
#sudo apt-get -y dist-upgrade

# or Update only all installed Programms
#sudo apt-get -y upgrade

# install web development tools
# sudo apt-get install apache2 mysql-server mysql-client php5 phpmyadmin

sudo apt-get -y install apt-clone

# Install additional codecs to run all sorts of media
sudo apt-get -y install ubuntu-restricted-extras

# install virtualbox-guest-additions
sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

#cd ~/
#mkdir ~/Upgrade
#cd ~/Upgrade

#sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
#sudo apt-get -y update
#sudo apt-get -y install elementary-tweaks

# Show listed all installed Packets on this System
#cat /etc/apt/sources.list  > sources.save.list
#cat /etc/apt/sources.list.d/*.list  >> sources.save.list
#mv sources.save.list ~/sources.save.txt

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
sudo usermod -aG vboxsf $USER

# umound cd disc with guest additions
sudo umount /mnt/VBGA/

sudo apt-get -y autoremove

sleep 3;
# remove guest additions
#rm -rf ~/$FILE
# remove installer
rm -rf ~/install.sh

sudo shutdown -r now
