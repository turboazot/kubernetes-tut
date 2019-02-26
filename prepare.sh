#!/bin/bash

set -ex

ssh-keygen -t rsa -b 4096 -N '' -C '' -P '' -f ~/.ssh/id_rsa

# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y \
    kubectl \
    python-pip

export LC_ALL=C

sudo pip install awscli

# Install KOPS
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/ 

# Install vim
git clone https://github.com/turboazot/vim-workspace
(cd ./vim-workspace && ./bin/install)

# Clone repo 
git clone https://github.com/wardviaene/kubernetes-course
