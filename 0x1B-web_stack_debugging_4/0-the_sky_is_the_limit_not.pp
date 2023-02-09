# Increases the amount of traffic an Nginx server can handle.

# Increases the amount of traffic an Nginx server can handle.
$file_to_edit = '/etc/nginx/nginx.conf'


exec { 'change_line_in_file':
  command => "sed -i '2s/4/auto/' ${file_to_edit}",
  path    => ['/bin','/usr/bin'],
  notify  => Exec['nginx_restart']
}



$file_to_edit_ = '/etc/default/nginx'


exec { 'change_line_in':
  command => "sed -i '5s/15/4096/' ${file_to_edit_}",
  path    => ['/bin','/usr/bin'],
  notify  => Exec['nginx_restart']
}

exec { 'nginx_restart':
  command     => 'service nginx restart',
  path        => '/usr/bin:/usr/sbin:/bin:/sbin',
  refreshonly => true,
}
