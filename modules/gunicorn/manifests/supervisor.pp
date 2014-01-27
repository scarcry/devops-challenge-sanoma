class gunicorn::supervisor ($project = "mezzanine_project") {
  file { "/etc/supervisor/conf.d/$project.conf":
    ensure => present,
    content => template("gunicorn/mezzanine_supervisor.conf.erb"),
    require => Package["supervisor"],
    notify => Service["supervisord"]
  }
}
