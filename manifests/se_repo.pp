class profile::se_repo {

  $repo = "${::osfamily}-${::operatingsystemmajrelease}-${::architecture}"

  yumrepo { 'se-repo':
    baseurl  => "http://${::servername}/yumrepo/${repo}",
    descr    => 'SE Cached Files',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  }
}
