class profile::pe_env {

  file { '/root/.bashrc':
    ensure => 'file',
    owner  => '0',
    group  => '0',
    mode   => '644',
  }

  file_line { 'root_puppet_path':
    ensure  => present,
    line    => 'PATH=/opt/puppet/bin:$PATH; export PATH',
    path    => '/root/.bashrc',
    require => File['/root/.bashrc'],
  }

  @@host { $fqdn:
    ensure       => 'present',
    host_aliases => [ $clientcert, $fqdn, $hostname ],
    ipaddress    => $ipaddress_eth1,
    tag          => 'seteam-demo-environment'
  }

  Host <<| tag=seteam-demo-environment |>>

  resources { 'host':
    purge => 'true',
  }

}
