#!/bin/bash

# Sjekk etter potensielle sikkerhetsproblemer
sudo apt-get install lynis -y
sudo lynis audit system

# Skann etter sårbarheter
sudo apt-get install nmap -y
sudo nmap -sS -sV -O localhost
