# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    
    BOX_IMAGE = "ubuntu/jammy64"
    BASE_INT_NETWORK = "10.10.20"
    BASE_HOST_ONLY_NETWORK = "192.168.56"
    VM_DB_NAME = "db.m340"
    VM_WEB_NAME = "web.m340"

    #configurazione macchina web server
    config.vm.define "web" do |subconfig|
        subconfig.vm.box = BOX_IMAGE

        subconfig.vm.hostname = VM_WEB_NAME

        subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
        subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
        
        subconfig.vm.provision "shell", path: "scripts/provision-update.sh"
        subconfig.vm.provision "shell", path: "scripts/setup-apache.sh"
        subconfig.vm.provision "shell", path: "scripts/setup-php.sh"

        # Cartella condivisa per il sito web
        subconfig.vm.synced_folder "./synced_folder", "/var/www/html"

        subconfig.vm.provider "virtualbox" do |vb|
            vb.name = VM_WEB_NAME
            vb.memory = "1024"
            vb.cpus = 2
        end
    end
    
    # configurazione macchina database
    config.vm.define "db" do |subconfig|
        subconfig.vm.box = BOX_IMAGE

        subconfig.vm.hostname = VM_DB_NAME

        subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true

        subconfig.vm.provision "shell", path: "scripts/provision-update.sh"
        subconfig.vm.provision "shell", path: "scripts/setup-mysql.sh"

        subconfig.vm.provider "virtualbox" do |vb|
            vb.name = VM_DB_NAME
            vb.memory = "1024"
            vb.cpus = 2
        end
    end
  
end