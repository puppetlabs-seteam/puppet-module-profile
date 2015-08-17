class profile::vim {

  package { 'git':
    ensure => installed,
  }

  package { 'vim':
    ensure => installed,
  }

  puppet_vim_env::install { 'default':
    require => Package['git'],
  }

}
