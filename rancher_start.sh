#!/bin/bash

echo "--- Running rancher_start.sh script ---"

RANCHER_IP=$1

# Rancher IP의 길이가 0일 경우 에러 메시지 출력
# sh의 test 문법
if [ -z "$RANCHER_IP" ]; then
  echo "Error: Rancher IP not provided as a parameter."
  exit 1
fi

echo "--- Running setup-rancher.sh script with IP: $RANCHER_IP ---"

# kubectl cluster-info에 대한 명령어를 실행하고 그 결과를 /dev/null이라는 일종의 블랙홀로 리다이렉트
# & 표준에러, > 표준출력을 둘 다 출력하지 않음
# 에러 발생시 에러 메시지를 출력후 종료
if ! kubectl cluster-info &> /dev/null; then
  echo "Error: kubectl is not configured correctly or cluster is not ready."
  echo "Please ensure RKE2 is running and kubeconfig is correctly set up."
  exit 1
fi

kubectl create namespace cattle-system
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo update
helm search repo rancher-stable
helm install rancher rancher-stable/rancher --namespace cattle-system --set hostname=rancher.$RANCHER_IP.nip.io --set replicas=1
