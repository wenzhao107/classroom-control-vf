# site/users/manifests/

define user::managed_user {
  user { $title:
  ensure => present,
  managehome => true,  
  }
  
  file { "/home/${title}":
    ensure => directory,
    mode => '0755',
    owner => $title,  
  }
  
  file { "/home/${title}/.ssh":
    ensure => directory,
    mode => '0700',
    owner => $title,  
  }
  
   file { "/home/${title}/.bashrc":
    ensure => file,
    mode => '0644',
    owner => $title,  
  }
  
  
}
