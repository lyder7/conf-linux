#!/bin/bash

# Oppdater systemet
sudo apt update
sudo apt upgrade -y

# Installer vanlige utviklerverktøy og -biblioteker
sudo apt install -y build-essential git curl wget make cmake zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev

# Installer Python 3 og pip
sudo apt install -y python3 python3-pip

# Installer Node.js og npm
sudo apt install -y nodejs npm

# Installer Java
sudo apt install -y default-jdk

# Installer PostgreSQL og sqlite3
sudo apt install -y postgresql postgresql-contrib sqlite3 libsqlite3-dev

# Installer Redis
sudo apt install -y redis-server

# Installer .NET SDK
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-5.0

# Konfigurer git
echo "Skriv inn ditt git-brukernavn:"
read git_username
echo "Skriv inn din git-e-post:"
read git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"

# Generer SSH-nøkkel
echo "Skriv inn ditt e-postadresse for SSH-nøkkelgenerering:"
read ssh_email

ssh-keygen -t ed25519 -C "$ssh_email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Kopier SSH-nøkkelen nedenfor og lim den inn i GitLab-kontoen din under Innstillinger > SSH-nøkler:"
cat ~/.ssh/id_ed25519.pub

