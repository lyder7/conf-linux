#!/bin/bash

# Oppdater systempakker
sudo apt-get update
sudo apt-get upgrade -y

# Fjern ubrukte pakker
sudo apt-get autoremove -y
