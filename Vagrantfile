# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "retropie-build" do |box|
      box.vm.hostname = "retropie-build"
      box.vm.box = "debian/stretch64"
  
      box.vm.provider :libvirt do |libvirt|
        libvirt.cpus = 32
        libvirt.memory = 16000
        libvirt.autostart = true
        libvirt.machine_virtual_size = 80
      end
  
      box.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractive
        apt update
        apt install wget curl git vim tmux htop make cloud-utils -y
  
        growpart /dev/vda 1
        resize2fs /dev/vda1

        curl -sSL https://get.docker.com/ | sh
        gpasswd -a vagrant docker
  
        service docker start
        curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose

      SHELL
    end
  end
  