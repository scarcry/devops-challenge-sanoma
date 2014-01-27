# snm-devops-challenge

Solution/implementation for DevOps Challenge.

## Installation 


* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://downloads.vagrantup.com/).

* Clone this repository:

        $ git clone git://github.com/dstotijn/snm-devops-challenge.git


## Usage

Inside the repository directory:

    $ vagrant up

A virtual machine is created, and Puppet is used to provision nginx, gunicorn (managed by supervisord), running an empty mezzanine project.
