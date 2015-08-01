#!/usr/bin/sh

cd ~/

#First you update your system
sudo apt-get -y update
#sudo -y apt-get dist-upgrade
sudo apt-get -y upgrade

# install php mysql apache webserver
# sudo apt-get install apache2 mysql-server mysql-client php5 phpmyadmin

# Install additional codecs to run all sorts of media
sudo apt-get -y install ubuntu-restricted-extras

# sudo apt-get install skype
mkdir Upgrade
cd ~/Upgrade

#sudo -y apt-get install virtualbox-guest-dkms
sudo apt-get -y install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Show listed all installed Packets on this System
cat /etc/apt/sources.list  > sources.save.list
cat /etc/apt/sources.list.d/*.list  >> sources.save.list
#mv sources.save.list ~/sources.save.txt

if [ ! -e VBoxGuestAdditions_5.0.0.iso ]; then
	wget -O VBoxGuestAdditions_5.0.0.iso http://download.virtualbox.org/virtualbox/5.0.0/VBoxGuestAdditions_5.0.0.iso
fi

sudo mkdir /mnt/VBGA/
sudo mount VBoxGuestAdditions_5.0.0.iso /mnt/VBGA/
#umount
cd /mnt/VBGA/
sudo ./VBoxLinuxAdditions.run

sleep 5;
shutdown -r now

