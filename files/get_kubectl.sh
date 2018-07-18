#!/bin/bash
#
# Install latest Kubectl binary into system.

echo -e "\nInstalling Curl"
apk add --no-cache curl
rm -rf /var/cache/apk/*

echo -e "\nGetting latest Kubectl binary"
curl -LO \
  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

echo -e "\nInstalling Kubectl into system\n"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
