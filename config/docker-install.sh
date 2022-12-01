#!/bin/bash
echo "updating and installing dependencis"
sudo apt-get update
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "Adding Keys"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


echo "Changing permissions"
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

echo "Installing Docker"
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "allow non sudo users"
sudo groupadd docker
sudo usermod -aG docker ubuntu
#newgrp docker
docker run hello-world
