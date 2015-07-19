class profile::pe_env {

  file { '/root/.bashrc':
    ensure => 'file',
    owner  => '0',
    group  => '0',
    mode   => '644',
  }

  file_line { 'root_puppet_path':
    ensure  => present,
    line    => 'PATH=${PATH}:/opt/puppet/bin; export PATH',
    path    => '/root/.bashrc',
    require => File['/root/.bashrc'],
  }

}
