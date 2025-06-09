#!/bin/bash

echo "--- Running install_rke2.sh script ---"

sudo curl -sfL https://get.rke2.io | sudo INSTALL_RKE2_TYPE="server" sh -
sudo systemctl enable rke2-server.service
sudo systemctl start rke2-server.service