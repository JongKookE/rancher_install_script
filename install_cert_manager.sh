#!/bin/bash

echo "--- Running install_cert_manager.sh script ---"

helm repo add jetstack https://charts.jetstack.io
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.2/cert-manager.yaml