#!/bin/bash

HOME=/home/vagrant

echo "--- Running kubectl_config.sh script ---"

sudo mkdir $HOME/.kube/
sudo cp /etc/rancher/rke2/rke2.yaml $HOME/.kube/config
export PATH=$PATH:/var/lib/rancher/rke2/bin/
echo 'export PATH=/usr/local/bin:/var/lib/rancher/rke2/bin:$PATH' >> $HOME/.bashrc
echo 'source <(kubectl completion bash)' >> $HOME/.bashrc
echo 'alias k=kubectl' >> $HOME/.bashrc
echo 'complete -F __start_kubectl k' >> $HOME/.bashrc

sudo chown vagrant:vagrant $HOME/.kube/config
sudo chmod 600 $HOME/.kube/config