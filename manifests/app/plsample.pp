# Class: tomcat::sample
#
#   This class installs the sample war in tomcat
#
class profile::app::plsample(
  $version = '1.0',
  $ensure = undef,
) {
  include profile::tomcat
  include profile::staging

  tomcat::war { 'plsample':
    ensure  => $ensure,
    warfile => "plsample-${version}.war",
    source  => "http://master/tomcat/plsample-${version}.war",
  }
}
