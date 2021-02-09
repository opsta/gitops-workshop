#!/bin/sh

# Generate SSH
[[ ! -f ~/.ssh/id_rsa ]] && ssh-keygen -f ~/.ssh/id_rsa -N ""

# Install Docker Compose
sudo CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip3 install docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.28.2/contrib/completion/bash/docker-compose \
  -o /etc/bash_completion.d/docker-compose
docker-compose version

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version

# Install Toolkit CLI
curl -s https://toolkit.fluxcd.io/install.sh | sudo bash

# Install Siege
sudo apt update
sudo apt -y install siege

# Install Grype
curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sudo sh -s -- -b /usr/local/bin

# Install Syft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin

# Put Bash Completion into .bashrc file
tee -a ~/.bashrc > /dev/null <<EOT
if command -v grype &> /dev/null
then
  # Bash Completion
  . <(kubectl completion bash)
  . <(helm completion bash)
  . <(flux completion bash)
  . <(grype completion bash)
  . <(syft completion bash)
fi
EOT
