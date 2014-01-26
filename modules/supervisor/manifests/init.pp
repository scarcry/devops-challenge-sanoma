class supervisor () {
  package { 'supervisor':
    ensure => present,
    provider => pip
  }

  exec { '/usr/bin/echo_supervisord_conf > /etc/supervisord.conf':
    creates => '/etc/supervisord.conf',
    require => Package["supervisor"],
    notify => Exec["supervisor_conf_include"]
  }

  file { '/etc/rc.d/init.d/supervisord':
    ensure => present,
    content => template("supervisor/supervisord.erb"),
    mode => 0755
  }

  service { 'supervisord':
    enable => true,
    ensure => running,
    require => [ Package["supervisor"], Exec["/usr/bin/echo_supervisord_conf > /etc/supervisord.conf"], File["/etc/rc.d/init.d/supervisord"] ]
  }
  
  file { [ '/etc/supervisor', '/etc/supervisor/conf.d' ]:
    ensure => directory
  }

  exec { 'supervisor_conf_include': 
    command => "/bin/echo \"[include]\"$'\n'\"files = supervisor/conf.d/*.conf\" >> /etc/supervisord.conf",
    require => File["/etc/supervisor/conf.d"],
    onlyif => "/usr/bin/test `/bin/grep -c conf.d /etc/supervisord.conf` -eq 0",
    notify => Service["supervisord"]
  }
}
