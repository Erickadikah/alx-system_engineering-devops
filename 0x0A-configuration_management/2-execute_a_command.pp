# manifest that kills killmenow

exec {'pkill':
  command   => 'pkill killmenow',
  provider  => 'shell',
}
