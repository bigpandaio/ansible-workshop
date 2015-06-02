# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  if Vagrant.has_plugin?("vagrant-cachier")
    #vagrant plugin install vagrant-cachier  -  see https://github.com/fgrehm/vagrant-cachier/
    config.cache.scope = :box
  end
  config.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
  end
 
  config.vm.define "ansible-workshop-vagrant" do |ansibleFTW|
      ansibleFTW.vm.network :forwarded_port, host: 8083, guest: 80
  end
end
