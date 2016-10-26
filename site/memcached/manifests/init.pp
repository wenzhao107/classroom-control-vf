package { 'memcached':
  ensure => present,
}
file { '/etc/memcached.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  PORT="11211"
  USER="memcached"
  MAXCONN="96"
  CACHESIZE="32"
  OPTIONS=""
  source => 'puppet:///etc/sysconfig/memcached/memcached.conf',
  require => Package['memcached'],
}
service { 'memcached':
  ensure => running,
  enable => true,
  subscribe => File['/etc/memcached.conf'],
}
