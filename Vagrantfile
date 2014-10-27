# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define 'server', primary: true do |server|
    server.vm.hostname = "server-security.desarrollo.unlp.edu.ar"
    server.omnibus.chef_version = :latest
    server.vm.box = "cespi/ubuntu-12.04-upgraded"
    server.vm.box_url = "http://desarrollo.unlp.edu.ar/ubuntu-12.04-upgraded.box"
    server.vm.network :private_network, ip: "10.99.2.2"
    server.berkshelf.enabled = true
    server.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        "recipe[apt::default]",
        "recipe[cespi_server_security::fw_icmp]",
        "recipe[cespi_server_security::fw_http]"
      ]
    end
  end
end
