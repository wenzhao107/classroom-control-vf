# nginx/manifests/init.pp
class nginx {

  package { 'nginx':
    ensure => present,
  }
  
  file { '/var/www': 
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  
  file { '/var/www/index.html':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
}
    
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
