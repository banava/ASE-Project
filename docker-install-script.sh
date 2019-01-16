#!/bin/sh
# script name: docker-install-script.sh

# install Docker
# curl is a tool to transfer data from or to a server, using one
# of the supported protocols (HTTP, HTTPS, FTP, etc). The command
# is designed to work without user interaction
echo "Installing Docker..."
curl -sSL https://get.docker.com/ | sh

# add user banava to docker group
echo "Adding user banava to docker group..."
sudo usermod -aG docker banava

# install docker-compose
# uname -s shows kernal name
# uname -m shows machine x86_64 for x86 64-bit machine
echo "Installating docker-compose..."
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# execute the docker compose file
# docker-compose up -d starts the containers in the background
# and leaves them running.
cd /vagrant
echo "Executing docker-compose up -d..."
docker-compose up -d
