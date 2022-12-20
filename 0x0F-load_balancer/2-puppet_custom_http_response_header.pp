# Script to install nginx using puppet

package {'nginx':
  ensure => 'present',
}

exec {'install':
  command  => 'sudo apt update -y';'sudo apt -y install nginx',
  provider => shell,

}

exec {'replace':
  command  => 'sudo sed -i "s/server_name _;/server_name _;\n\n\tadd_header X-Served-By \$hostname;\n/" /etc/nginx/sites-enabled/default',
  provider => shell,
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
