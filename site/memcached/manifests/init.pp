# memcached/manifests/init.pp
class memcached {
  package { 'memcached':
    ensure => present,
  }
  
  file { '/etc/sysconfig/memcached':
    ensure  => file,
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
  
  service { 'memcached':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/sysconfig/memcached'],
  }
 }
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. 
