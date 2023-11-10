#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./scripts/utils.sh

echo_info "Installing apps..."

# Update Ubuntu
sudo apt update && sudo apt upgrade -y

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install -y ubuntu-wsl

# Essential package
sudo apt install -y build-essential

# Common packages
sudo apt install -y apt-transport-https ca-certificates curl gawk ssh-askpass tree unzip wget zsh

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update && sudo apt install -y git

# NVM
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Finish
echo_success "Finished applications installation."
