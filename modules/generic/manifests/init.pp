class generic () {

  file { '/etc/motd':
    ensure => present,
    content => template("generic/motd.erb"),
    mode => 0644
  }
}
