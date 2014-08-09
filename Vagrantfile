# -*- mode: ruby -*-
# vi: set ft=ruby :

# Use vagrant up to setup the box.
# vagrant ssh if you need to edit anything on the server
# vagrant destroy to start over from scratch
# As i standard with vagrant machines, the
# vagrant user has passwordless sudo access on the guest machine

Vagrant.configure("2") do |config|

  #Ubuntu 14.04 Server 64-bit box supporting VirtualBox and VMware providers. 
  config.vm.box = "misheska/ubuntu1404"
  config.vm.box_download_insecure = true
  config.vm.hostname = "ail.example.com"
  config.vm.provision "shell", path: 'setup.sh'
  config.vm.network "forwarded_port", guest: 7000, host: 7000
  config.vm.synced_folder '.', '/home/vagrant/setup'
  # https://github.com/smdahlen/vagrant-digitalocean
  # Use vagrant up --provider=digital_ocean to setup a
  # drople on digitalocean, not a Virtualbox/Vmware guest.
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = ENV['DO_TOKEN']
    provider.image = 'Ubuntu 14.04 x64'
    provider.region = 'ams1'
    provider.size = '512mb'
  end
end
