#!/bin/bash
echo "hola hello"
docker build -t 7205a9a9b45bde8b78a5b0ee2f7cccd475cc6694 .
# sudo apt-get update
# sudo apt-get -y install \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# sudo apt-get update

# sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# #allow non sudo users
# sudo groupadd docker
# sudo usermod -aG docker ubuntu
# newgrp docker
# docker run hello-world
