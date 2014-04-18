# Sanoma DevOps challenge

An implementation for Sanoma's DevOps Challenge.

# Requirements

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html).

* Clone this repository:

  $ git clone git://github.com/scarcry/devops-challenge-sanoma.git

* Add `127.0.0.1 sanoma.local` to your `hosts` file (we're using a vhost with nginx).

# Usage

* Inside your git repo directory:

  $ vagrant up

A CentOS 6.4 64bit VM is created based on the Vagrant box located at https://s3-eu-west-1.amazonaws.com/snm-nl-hostingsupport-test/vagrant-centos-6-4.box.
We then provision the box with an empty mezzanine project served by nginx using a vhost with supervisord to manage gunicorn as a service, all using Puppet.

* [Browse](http://sanoma.local:8081) to your newly provisioned project.
