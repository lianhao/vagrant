# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
$num_compute_nodes = 0

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider :virtualbox do |vb|
    #vb.customize ["modifyvm", :id, "--memory", 8192]
    #vb.customize ["modifyvm", :id, "--cpus", 4]
    vb.customize "post-boot",["controlvm", :id, "setlinkstate1", "on"]
  end

  config.vm.provision "shell", path: "bootstrap.sh", privileged: false

  config.vm.define "control" do |config|
    config.vm.hostname = "control"
    config.vm.network "private_network", ip: "192.168.1.20"
    #config.vm.provision "shell", path: "setup_control.sh", privileged: false
    config.vm.provision "shell", path: "setup_tempest.sh", privileged: false
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 8192]
      vb.customize ["modifyvm", :id, "--cpus", 4]
    end
  end

  (1 .. $num_compute_nodes).each do |n|
    config.vm.define vm_name = "compute-#{n}" do |config|
      config.vm.hostname = vm_name
      config.vm.network "private_network", ip: "192.168.1.#{n+20}"
      config.vm.provision "shell", path: "setup_compute.sh", privileged: false

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 4096]
        vb.customize ["modifyvm", :id, "--cpus", 4]
      end
    end
  end
end
