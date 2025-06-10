Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master_private_ip = "192.168.56.101"
    master.vm.box = "ubuntu/focal64"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: master_private_ip

    master.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
    end

    master.vm.provision "shell", path: "setup.sh"
    master.vm.provision "shell", path: "install_rke2.sh"

    master.vm.provision "shell", path: "kubectl_config.sh"
    master.vm.provision "shell", path: "install_k9s.sh"
    master.vm.provision "shell", path: "install_helm.sh"
    master.vm.provision "shell", path: "install_cert_manager.sh"
    master.vm.provision "shell", path: "rancher_start.sh", args: [master_private_ip]
  end

  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker"
    worker.vm.network "private_network", ip: "192.168.56.102"

    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
    end
    worker.vm.provision "shell", path: "install_rke2_worker.sh", args: [master_private_ip]
  end
end
