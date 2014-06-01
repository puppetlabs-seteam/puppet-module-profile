# this is the offline class, it gets applied to all agents
# and ensures they are able to work with local on networks
class profile::offline {
  include stdlib::stages

  case "$::osfamily $::os_maj_version" {
    "RedHat 6": {
      class { '::profile::el6_repo':
      stage => 'setup',
      }
    }
  }
}
