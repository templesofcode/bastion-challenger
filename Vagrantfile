Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.17"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.hostname = "bastion-challenger"

  config.vm.provision "shell", path: "resources/tools.sh"
  config.vm.provision "shell", path: "resources/provision.sh"
end
