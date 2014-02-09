# Class: tomcat::sample
#
#   This class installs the sample war in tomcat
#
class profile::app::sample(
  $sample_version = '1.0',
) {
  $sample_war_file = "sample-${sample_version}.war"

  tomcat::war { 'sample':
    filename => $sample_war_file,
  }
}
