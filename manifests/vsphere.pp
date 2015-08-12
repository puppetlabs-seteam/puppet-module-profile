# This profile is intended to demonstrate the provisioning and basic configuration of vmware using the vsphere module
class profile::vsphere (
  $vspherehost     = 'tse-vc1-prod.corp.puppetlabs.net',
  $vsphereusername = 'testuser@vsphere.local',
  $vspherepassword = 'puppetlabs',
  $status          = 'running',
  #This is required, please check before clobbering someone else's vms
  $folder,
  ){
  #Install required packages for vsphere management
  $packages = [zlib-devel,libxslt-devel,patch,gcc]
  package { $packages:
    ensure => present,
  }

  #Install required gems for vsphere management
  $gems = [rbvmomi,hocon]
  package { $gems:
    provider => puppet_gem,
    ensure => present,
  }

  #Configure host/credentials for vsphere host
  file { '/etc/puppetlabs/puppet/vcenter.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('profile/vcenter.conf.erb'),
  }

  #Actual Vsphere VMs
  $vms = [ "/west1/vm/TSEs/${folder}/test1",
         "/west1/vm/TSEs/${folder}/test2",
         "/west1/vm/TSEs/${folder}/test3" ]

  vsphere_vm { $vms:
    ensure => $status,
    source => '/west1/vm/Templates/centos-6-x86_64-noagent-ssd',
    memory => 1024,
    cpus   => 2,
  }

  #Purging example:
  #resources { 'vsphere_vm':
  #  purge => true,
  #  noop  => true,
  #}
}
