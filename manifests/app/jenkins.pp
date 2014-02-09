# Class: tomcat::jenkins
#
#   This class models the Jenkins Continuous Integration
#   service in Puppet.
#
class profile::app::jenkins(
  $jenkins_version = '1.400',
) {
  $jenkins_war_file = "jenkins-${jenkins_version}.war"
  $jenkins_packages = ['fontconfig', 'dejavu-sans-fonts']

  package{ $jenkins_packages:
    ensure => installed,
    before => Tomcat::War['jenkins'],
  }
  
  tomcat::war { 'jenkins':
    filename => $jenkins_war_file,
    stage    => deploy_app,
  }
}
