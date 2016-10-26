# memcached/manifests/init.pp
class memcached {

  package { 'memcached':
    ensure => present,
  }
  
  file { '/etc/sysconfig/memcached':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///etc/sysconfig/memcached/memcached.conf',
    require => Package['memcached'],
  }

  service { 'memcached':
    ensure => running,
    enable => true,
    subscribe => File['/etc/sysconfig/memcached'],
  }

}
