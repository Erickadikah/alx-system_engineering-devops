# using puppet to install flask from pip3

exec { 'flask':
  command =>'/usr/bin/apt-get -y install puppet-lint -v 2.5.0',
}
