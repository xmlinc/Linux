#!/usr/bin/bash

cd ~/

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade

# install php mysql apache webserver
# sudo apt-get install apache2 mysql-server mysql-client php5 phpmyadmin

# sudo apt-get install skype
mkdir upgrade

sudo apt-get install virtualbox-guest-dkms
#sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

# Show listed all installed Packets on this System
cat /etc/apt/sources.list /etc/apt/sources.list.d/*.list  > sources.save.list
mv sources.save.list -/sources.save.txt
