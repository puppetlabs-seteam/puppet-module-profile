class profile::tomcat (
  $tomcat_version = '6.0.35',
) {
  include profile::firewall

  class { '::tomcat':
    tomcat_version => $tomcat_version,
    require        => Class['::staging'],
  }

  firewall { '100 allow connections to tomcat':
    proto   => 'tcp',
    dport   => '8080',
    action  => 'accept',
  }

}
