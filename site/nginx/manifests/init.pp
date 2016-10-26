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
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
