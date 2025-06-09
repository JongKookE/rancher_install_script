#!/bin/bash

echo "--- Running setup.sh script ---"

swapoff -a

# 스왑 비활성화
# swap이라는 문자열을 찾아 첫번째 줄에 있는 문자열을 주석처리
sudo sed -i '/ swap / s/^/#/' /etc/fstab

# 패키지 업데이트
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get update -y
sudo systemctl stop ufw sudo && sudo ufw disable && sudo iptables -F