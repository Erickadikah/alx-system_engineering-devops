# Automate creating a custom HTTP header response, but with Puppet:

# Pupper manifet to install nginx and others requirements

$link = 'https://www.youtube.com/watch?v=QH2-TGUlwu4'
$redirect = "\trewrite ^/redirect_me/$ ${link} permanent;"
$custom_header = "add_header X-Served-By ${hostname};"

exec { 'update packages':
  command => '/usr/bin/apt-get update',
}

exec { 'restart nginx':
  command => '/usr/sbin/service nginx restart',
  require => Package['nginx']
}

-> package { 'nginx':
  ensure  => installed,
  require => Exec['update packages']
}

-> file_line { 'Add redirection, 301':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => '$redirect',
}

-> file_line { 'Set X-Served-By header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => $custom_header,
}

-> file { '/var/www/html/index.html':
  ensure  => 'present',
  content => 'Hello World!',
}
-> service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
