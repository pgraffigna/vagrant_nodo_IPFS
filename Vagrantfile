# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGEN = "geerlingguy/ubuntu1804"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
    
  config.vm.define "master" do |m|
    m.vm.box = IMAGEN
    m.vm.network "private_network", ip: "192.168.60.10"
    m.vm.network "forwarded_port", guest: 5001, host: 5001
    m.vm.hostname = "master"
    
    m.vm.provider :virtualbox do |vb|
      vb.name = "template"
      vb.memory = 2048
      vb.cpus = 2
      vb.check_guest_additions = false 
    end
  end  
end