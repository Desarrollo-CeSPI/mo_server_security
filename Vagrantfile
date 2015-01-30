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
    server.omnibus.chef_version = "11.16.4"
    server.vm.box = "chef/ubuntu-12.04"
    server.vm.network :private_network, ip: "10.99.2.2"
    server.berkshelf.enabled = true
    server.vm.provision :chef_solo do |chef|
      chef.data_bags_path = './sample/data_bags'
      chef.json = {
      }
      chef.run_list = [
        "recipe[chef-solo-search]",
        "recipe[mo_server_base]",
        "recipe[mo_server_security]",
        "recipe[mo_server_security::sysctl]",
        "recipe[mo_server_security::fw_icmp]",
        "recipe[mo_server_security::fw_http]"
      ]
    end
  end
end
