#!/bin/bash

echo "--- Running install_rke2_worker.sh script ---"

# 마스터 노드의 IP 주소를 인자로 받습니다.
RKE2_SERVER_IP=$1

if [ -z "$RKE2_SERVER_IP" ]; then
  echo "Error: RKE2 server IP not provided as argument."
  exit 1
fi

# RKE2 agent 설치 스크립트 다운로드 및 실행 (마스터 노드와 동일 버전 사용 권장)
# INSTALL_RKE2_VERSION=vX.Y.Z+rke2rN (마스터와 같은 버전으로 명시적으로 지정하는 것이 좋음)
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh -

sudo mkdir -p /etc/rancher/rke2/

RKE2_TOKEN=$(cat /vagrant/rke2_token.txt)
echo "RKE2 Token found: $RKE2_TOKEN"

sudo curl -sfLks https://get.rke2.io | sudo INSTALL_RKE2_TYPE="agent" K3S_URL="https://$RKE2_SERVER_IP:9345" K3S_TOKEN="$RKE2_TOKEN" sh -

# RKE2 agent 서비스 활성화 및 시작
sudo systemctl enable rke2-agent.service
sudo systemctl start rke2-agent.service

echo "RKE2 worker node joined to cluster."
echo "--- install_rke2_worker.sh script finished ---"