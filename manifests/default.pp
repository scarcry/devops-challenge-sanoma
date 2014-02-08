$user = "sanoma"
$password = "devops"
$project = "myproject"

user { "$user":
  ensure => 'present',
  password => sha1("$password"),
  home => "/home/$user",
  managehome => true
}

file { "/home/$user":
  ensure => directory,
  owner => $user,
  group => $user,
  mode => 0701,
  require => User["$user"]
}

class { 'mezzanine':
  user => $user,
  project => $project
}

class { 'nginx': }
class { 'nginx::mezzanine_vhost':
  project => $project
}
class { 'gunicorn': }
class { 'supervisor': }
class { 'gunicorn::supervisor':
  project => $project
}
