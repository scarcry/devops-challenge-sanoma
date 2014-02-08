# snm-devops-challenge

Solution/implementation for DevOps Challenge.

## Installation 


* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://downloads.vagrantup.com/).

* Clone this repository:

        $ git clone git://github.com/dstotijn/snm-devops-challenge.git

* Add `127.0.0.1 sanoma.local` to your `hosts` file.

## Usage

* Inside the repository directory:

        $ vagrant up

A virtual machine is created, and Puppet is used to provision a mezzanine project, nginx with a vhost configuration, gunicorn, and supervisord to manage gunicorn as a service.

* [Browse](http://sanoma.local:8080) to the newly provisioned mezzanine project.
