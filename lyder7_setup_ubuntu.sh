#!/bin/bash

# Sjekk om scriptet kjører som superbruker
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Lag en ny mappe for prosjektet og naviger til mappen
mkdir my_project && cd my_project

# Opprett mapper for forskjellige konfigurasjonsfiler
mkdir scripts && mkdir configs && mkdir logs

# Opprett standard konfigurasjonsfiler for Ubuntu
touch configs/ubuntu_config.conf
echo "Setting up default Ubuntu configuration..." > logs/setup.log

# Installer standard programmer som er nyttige for utvikling på Ubuntu
apt update
apt install git curl wget build-essential python3 python3-pip r-base gdebi-core

# Installer RStudio og VS Code
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2021.09.0-351-amd64.deb
gdebi -n rstudio-2021.09.0-351-amd64.deb
rm rstudio-2021.09.0-351-amd64.deb

wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
gdebi -n code.deb
rm code.deb

# Installer Radian i VS Code
R -e "install.packages('remotes', repos='http://cran.us.r-project.org')"
R -e "remotes::install_github('radian', 'r-lib')"
code --install-extension radian.devtools

# Gjør scripts mappen tilgjengelig for system PATH
echo 'export PATH="$HOME/my_project/scripts:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "Project setup complete!"
