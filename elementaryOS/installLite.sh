#!/bin/bash

cd ~/
#First you update your system
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y upgrade

# Install additional codecs to run of video media
sudo apt-get -y install flashplugin-installer

sudo apt-get -y install skype

sudo apt-get -y autoremove

sleep 3;
sudo shutdown -r now

# remove installer
rm -rf ~/installPro.sh
