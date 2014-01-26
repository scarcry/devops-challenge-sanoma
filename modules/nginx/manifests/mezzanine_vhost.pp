class nginx::mezzanine_vhost () {
  file { '/etc/nginx/conf.d/myproject.conf':
    ensure => present,
    content => template("nginx/mezzanine_vhost.conf.erb"),
    require => Package["nginx"],
    notify => Service["nginx"]
  }
}
