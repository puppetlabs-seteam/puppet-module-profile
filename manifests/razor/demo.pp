class puppet-module-profile::razor::demo {

  if $razor_content_installed != 'true' {

    file { '/tmp/pe-broker.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/pe-broker.json',
    }

    file { '/tmp/centos-6.5-repo.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/centos-6.5-repo.json',
    }

    file { '/tmp/small-tag.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/small-tag.json',
    }

    file { '/tmp/large-tag.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/large-tag.json',
    }

    file { '/tmp/policy-small.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/policy-small.json',
    }

    file { '/tmp/policy-large.json':
      ensure => present,
      source => 'puppet:///modules/puppet-module-profile/razordemo/policy-large.json',
    }

    exec { 'Install Repo':
      path => "/usr/bin",
      command => "razor create-repo --json /tmp/centos-6.5-repo.json",
      require => File["/tmp/centos-6.5-repo.json"],
    } ->

    exec { 'Install PE Broker':
      path => "/usr/bin",
      command => "razor create-broker --json /tmp/pe-broker.json",
      require => File["/tmp/pe-broker.json"],
    } ->

    exec { 'Install Small Tag':
      path => "/usr/bin",
      command => "razor create-tag --json /tmp/small-tag.json",
      unless => "razor tags test small",
      require => File["/tmp/small-tag.json"],
    } ->

    exec { 'Install Large Tag':
      path => "/usr/bin",
      command => "razor create-tag --json /tmp/large-tag.json",
      unless => "razor tags test large",
      require => File["/tmp/large-tag.json"],
    } ->

    exec { 'Install Small Policy':
      path => "/usr/bin",
      command => "razor create-policy --json /tmp/policy-small.json",
      require => File["/tmp/policy-small.json"],
    } ->

    exec { 'Install Large Policy':
      path => "/usr/bin",
      command => "razor create-policy --json /tmp/policy-large.json",
      require => File["/tmp/policy-large.json"],
    } ->

    file { '/etc/puppetlabs/facter':
      ensure => directory,
    } ->

    file { '/etc/puppetlabs/facter/facts.d':
      ensure => directory,
    } ->

    file { '/etc/puppetlabs/facter/facts.d/razor_content_installed.sh':
      ensure => present,
      mode => 0755,
      source => 'puppet:///modules/puppet-module-profile/razordemo/razor_content_installed.sh',
    }

  }

}
