# nginx/manifests/init.pp
class nginx {

  File {
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
  
  package { 'nginx':
    ensure => present, 

  }
  
  
  file { '/var/www': 
    ensure => directory,
  }
  
  file { '/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { '/etc/nginx/conf.d/default.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
}
    
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
