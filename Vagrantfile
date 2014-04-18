Vagrant.configure("2") do |config|
  config.vm.box = "vagrant-centos-6-4"
  config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/snm-nl-hostingsupport-test/vagrant-centos-6-4.box"
  config.vm.hostname = "sanoma.local"
  config.vm.network :forwarded_port, host: 8081, guest: 80

  # Puppet Provisioner config
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

end
