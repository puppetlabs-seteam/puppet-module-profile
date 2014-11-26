class profile::tomcat (
  $version = undef,
  $catalina_base = undef,
  $catalina_home = undef,
  $instance_name = undef,
) {
  case $version {
     '6': { $tomcat_minor_version = '6.0.35' }
     '7': { $tomcat_minor_version = '7.0.25' }
  }
  include profile::firewall

  class { '::tomcat':}
  tomcat::instance{ $instance_name:
    install_from_source => true,
    source_url => "http://master.inf.puppetlabs.demo/tomcat/apache-tomcat-${tomcat_minor_version}.tar.gz",
    source_strip_first_dir => false,
    catalina_base => "${catalina_base}",
    catalina_home => "${catalina_home}",
  }

  firewall { '100 allow connections to tomcat':
    proto   => 'tcp',
    dport   => '8080',
    action  => 'accept',
  }

}
