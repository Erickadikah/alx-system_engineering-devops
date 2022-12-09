# using puppet ton install flask from pip3

exec { 'flask':
	command => '/usr/bin/apt-get  -y install python3-flask',
}
