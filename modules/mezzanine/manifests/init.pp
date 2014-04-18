class mezzanine ($user = 'mezzanine_user', $project = 'mezzanine_project') {
  package {
    'epel-release':
      provider => rpm,
      ensure => present,
      source => "http://ftp.nluug.nl/pub/os/Linux/distr/fedora-epel/6/x86_64/epel-release-6-8.noarch.rpm";
    'python-devel':
      ensure => present;
    'python-pip':
      ensure => present,
      require => Package["epel-release"];
    'mezzanine':
      provider => pip,
      ensure => present,
      require => [ Package["python-pip"], Package["python-devel"] ];
  }

  exec { "/usr/bin/mezzanine-project $project":
    user => $user,
    cwd => "/home/$user",
    creates => "/home/$user/$project/manage.py",
    require => [ Package["mezzanine"], File["/home/$user"] ];
  }

  exec { '/usr/bin/python manage.py createdb --noinput':
    user => $user,
    cwd => "/home/$user/$project",
    creates => "/home/$user/$project/sanoma.db",
    require => Exec["/usr/bin/mezzanine-project $project"]
  }

  exec { '/usr/bin/python manage.py collectstatic --noinput':
    user => $user,
    cwd => "/home/$user/$project",
    creates => "/home/$user/$project/static/css",
    require => Exec["/usr/bin/mezzanine-project $project"]
  }

  file { "/home/$user/$project/local_settings.py":
    ensure => present,
    owner => $user,
    group => $user,
    content => template("mezzanine/local_settings.py.erb"),
    require => Exec["/usr/bin/mezzanine-project $project"]
  }
}
