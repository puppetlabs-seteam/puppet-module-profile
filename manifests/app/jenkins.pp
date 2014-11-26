class profile::app::jenkins (
  $version = 'latest',
  $tomcat_major_version = '7',
  $catalina_base = "/opt/apache-tomcat",
  $catalina_home = "${catalina_base}",
) {
  include profile::staging
  class { 'java':
    distribution => 'jre'
  }
  class { 'profile::tomcat':
    version       => $tomcat_major_version,
    catalina_base => $catalina_base,
    catalina_home => $catalina_home,
    instance_name => 'jenkins',
  }->
  tomcat::setenv::entry { 'JENKINS_HOME':
    value => "\"-DJENKINS_HOME=${catalina_base}/webapps/jenkins\"",
    param => 'CATALINA_OPTS',
    before => Tomcat::War [ "jenkins-${version}.war" ],
    notify => Tomcat::War [ "jenkins-${version}.war" ],
  }
  tomcat::war { "jenkins-${version}.war" :
    war_source => "http://master.inf.puppetlabs.demo/war/${version}/jenkins.war",
    catalina_base => "${catalina_base}",
    before => File [ "${catalina_base}/webapps/jenkins" ],
    notify => File [ "${catalina_base}/webapps/jenkins" ],
  }
  file { "${catalina_base}/webapps/jenkins":
    ensure => 'link',
    target => "${catalina_base}/webapps/jenkins-${version}",
  }
  tomcat::service { "jenkins":
    catalina_base => "${catalina_base}",
    catalina_home => "${catalina_home}",
    service_name => "jenkins",
    subscribe => File [ "${catalina_base}/webapps/jenkins" ],
  }
}

