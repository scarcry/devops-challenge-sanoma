class mezzanine () {
  package {
    'epel-release':
      provider => rpm,
      ensure => present,
      source => "http://mirror.nl.leaseweb.net/epel/6/i386/epel-release-6-8.noarch.rpm";
    'python-pip':
      ensure => present,
      require => Package["epel-release"];
    'python-devel':
      ensure => present;
    'mezzanine':
      provider => pip,
      ensure => present,
      require => [ Package["python-pip"], Package["python-devel"] ];
  }

  exec { '/usr/bin/mezzanine-project myproject':
    user => 'sanoma',
    cwd => '/home/sanoma',
    creates => '/home/sanoma/myproject/manage.py',
    require => [ Package["mezzanine"], File["/home/sanoma"] ];
  }

  exec { '/usr/bin/python manage.py createdb --noinput':
    user => 'sanoma',
    cwd => '/home/sanoma/myproject',
    creates => '/home/sanoma/myproject/default.db',
    require => Exec["/usr/bin/mezzanine-project myproject"]
  }

  exec { '/usr/bin/python manage.py collectstatic --noinput':
    user => 'sanoma',
    cwd => '/home/sanoma/myproject',
    creates => '/home/sanoma/myproject/static/css',
    require => Exec["/usr/bin/mezzanine-project myproject"]
  }

  file { '/home/sanoma/myproject/local_settings.py':
    ensure => present,
    owner => 'sanoma',
    group => 'sanoma',
    content => template("mezzanine/local_settings.py.erb")
  }
}
