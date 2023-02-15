#!/bin/bash

# Installer R og RStudio
sudo apt-get install r-base -y
sudo apt-get install gdebi-core -y
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1717-amd64.deb
sudo gdebi rstudio-1.4.1717-amd64.deb -n

# Installer VS Code
sudo snap install --classic code

# Installer Radian
sudo apt-get install python3-pip -y
pip3 install radian
