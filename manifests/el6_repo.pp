class profile::el6_repo (
  $repohostname = 'master',
) {
  yumrepo { 'se_mirror':
    ensure   => present,
    baseurl  => "http://${repohostname}/rpms/",
    enabled  => 1,
    gpgcheck => 0,
    priority => 1,
  }
}
