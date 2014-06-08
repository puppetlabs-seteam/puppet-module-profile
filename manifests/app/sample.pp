# Class: tomcat::sample
#
#   This class installs the sample war in tomcat
#
class profile::app::sample(
  $version = '1.0',
  $ensure = undef,
) {
  include profile::tomcat
  include profile::staging

  tomcat::war { 'sample':
    ensure  => $ensure,
    warfile => "sample-${version}.war",
    source  => "http://master/tomcat/sample-${version}.war",
  }
}
