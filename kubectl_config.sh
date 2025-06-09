#!/bin/bash

set -eux # 이 줄을 추가하면, 실행되는 각 명령어가 출력되고 오류 발생 시 스크립트가 즉시 종료

HOME=/home/vagrant

echo "--- Running kubectl_config.sh script ---"

sudo mkdir /home/vagrant/.kube/
sudo cp /etc/rancher/rke2/rke2.yaml $HOME/.kube/config
export PATH=$PATH:/var/lib/rancher/rke2/bin/
echo 'export PATH=/usr/local/bin:/var/lib/rancher/rke2/bin:$PATH' >> $HOME/.bashrc
echo 'source <(kubectl completion bash)' >> $HOME/.bashrc
echo 'alias k=kubectl' >> $HOME/.bashrc
echo 'complete -F __start_kubectl k' >> $HOME/.bashrc

sudo chown vagrant:vagrant $HOME/.kube/config
sudo chmod 600 $HOME/.kube/config