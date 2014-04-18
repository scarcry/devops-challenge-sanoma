Vagrant.configure("2") do |config|
  config.vm.box = "centos-6.4-64bit"
  config.vm.hostname = "sanoma.local"
  config.vm.network :forwarded_port, host: 8081, guest: 80

  # Puppet Provisioner config
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

end
