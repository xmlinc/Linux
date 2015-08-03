#!/bin/bash

cd ~/
#First you update your system
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y upgrade

# to recovery of settings
sudo apt-get -y install apt-clone

sudo apt-get -y install skype

sudo apt-get -y autoremove

sleep 3;
sudo shutdown -r now

# remove installer
rm -rf ~/installPro.sh
