class profile::app::jenkins (
  $version = 'latest',
  $catalina_base = "/opt/apache-tomcat",
  $catalina_home = "${catalina_base}",
) {
  include profile::staging
  include java
  include profile::tomcat
  tomcat::setenv::entry { 'JENKINS_HOME':
    value   => "\"-DJENKINS_HOME=${catalina_base}/webapps/jenkins\"",
    param   => 'CATALINA_OPTS',
    before  => Tomcat::War [ "jenkins-${version}.war" ],
    notify  => Tomcat::War [ "jenkins-${version}.war" ],
    require => Class [ 'profile::tomcat' ],
  }
  tomcat::war { "jenkins-${version}.war" :
    war_source    => "http://master.inf.puppetlabs.demo/war/${version}/jenkins.war",
    catalina_base => "${catalina_base}",
    before        => File [ "${catalina_base}/webapps/jenkins" ],
    notify        => File [ "${catalina_base}/webapps/jenkins" ],
  }
  file { "${catalina_base}/webapps/jenkins":
    ensure => 'link',
    target => "${catalina_base}/webapps/jenkins-${version}",
  }
  tomcat::service { "jenkins":
    catalina_base => "${catalina_base}",
    catalina_home => "${catalina_home}",
    service_name  => "jenkins",
    subscribe     => File [ "${catalina_base}/webapps/jenkins" ],
  }
}

