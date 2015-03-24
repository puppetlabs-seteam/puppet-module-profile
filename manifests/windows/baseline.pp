class profile::windows::baseline {

  require registry
  contain 'chocolatey'


  reboot { 'before install':
    when => pending,
  }

  Package {
    ensure   => installed,
    provider => chocolatey,
    require => Class['chocolatey'],
  }

  package { 'Firefox': }

  package { 'notepadplusplus': }

  package { '7zip': }

  package { 'git': }

}
