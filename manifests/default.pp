user { 'sanoma':
  ensure => 'present',
  password => 'devops'
}

file { '/home/sanoma':
  ensure => directory,
  owner => 'sanoma',
  group => 'sanoma',
  mode => 0701,
  require => User["sanoma"];
}

class { 'mezzanine': }
class { 'nginx': }
class { 'nginx::mezzanine_vhost': }
class { 'gunicorn': }
class { 'supervisor': }
class { 'gunicorn::supervisor': }
