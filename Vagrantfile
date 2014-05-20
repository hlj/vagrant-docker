# -*- mode: ruby -*-
# vi: set ft=ruby :

# Force the provider so we don't have to type in --provider=docker all the time
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "db" do |db1|
   db1.vm.provider "docker" do |d|
     d.vagrant_vagrantfile = "docker_host/Vagrantfile"
     d.image = "dockerfile/redis"
     d.name = "demo_db"
     #d.force_host_vm = true
   end
  end

  config.vm.define "rails" do |rails|
    rails.vm.provider "docker" do |d|
      d.vagrant_vagrantfile = "docker_host/Vagrantfile"
      d.build_dir = "dockerfiles/rails"
      d.ports = ["3000:3000", "2244:22"]
      d.create_args = ["-h=rails_vm"]
      d.link "demo_db:redis"
      d.has_ssh = true
      # Mapping to the host, only need in Host VM.
      d.volumes = ["/var/lib/docker_root:/vagrant"]
      #d.force_host_vm = true
    end

    # use own key file
    rails.ssh.private_key_path = "dockerfiles/docker_vm.key"
    rails.ssh.username = "root"
    rails.ssh.port = "22"
  end


end
