#!/bin/bash

echo "--- Running install_rke2.sh script ---"

sudo curl -sfL https://get.rke2.io | sudo INSTALL_RKE2_TYPE="server" sh -
sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service

# 토큰 추출 후 vagrant 공유 폴더에 저장
RKE2_TOKEN=$(sudo cat /var/lib/rancher/rke2/server/token)
# 토큰을 vagrantfile이 있는 host pc에 저장
echo "$RKE2_TOKEN" | sudo tee /vagrant/rke2_token.txt > /dev/null

echo "RKE2 token extracted and saved to /vagrant/rke2_token.txt"
echo "--- install_rke2.sh script finished --