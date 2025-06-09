#!/bin/bash

echo "--- Running install_k9s.sh script ---"

wget https://github.com/derailed/k9s/releases/download/v0.50.6/k9s_linux_amd64.deb
dpkg -i k9s_linux_amd64.deb