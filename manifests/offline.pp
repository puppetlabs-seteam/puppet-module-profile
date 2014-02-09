# this is the offline class, it gets applied to all agents
# and ensures they are able to work with local on networks
class profile::offline {
  include stdlib::stages

  # nested if statemens, yaaay
  if $::osfamily == 'RedHat' {
    if $::os_maj_version == '6' {
      class { '::profile::el6_repo':
        stage => 'setup',
      }
    }
  }
}
