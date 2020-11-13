#!/bin/sh

# Generate SSH
[[ ! -f ~/.ssh/id_rsa ]] && ssh-keygen -f ~/.ssh/id_rsa -N ""

# Update openssl
sudo apt update
sudo apt install -y openssl

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version
export LD_LIBRARY_PATH="/usr/local/lib"

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version

# Install Toolkit CLI
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash

# Install Siege
sudo apt update
sudo apt -y install siege
