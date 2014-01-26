class gunicorn::supervisor () {
  file { '/etc/supervisor/conf.d/myproject.conf':
    ensure => present,
    content => template("gunicorn/mezzanine_supervisor.conf.erb"),
    require => Package["supervisor"],
    notify => Service["supervisord"]
  }
}
