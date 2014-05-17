# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.define "db" do |db1|
  #  db1.vm.provider "docker" do |d|
  #    d.vagrant_vagrantfile = "vm_rails/hostmachine/Vagrantfile"
  #    d.image = "dockerfile/redis"
  #    d.ports = ["6379:6379"]
  #  end
  #end

  config.vm.define "rails" do |rails|
    rails.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "vm_rails/hostmachine/Vagrantfile"
      d.build_dir = "vm_rails/"
      d.ports = ["3000:3000"]
      d.has_ssh = true
    end
  end

  config.ssh.username = "root"
  config.ssh.private_key_path = "vm_rails/docker_vm.key"
  config.ssh.port = "22"
end
