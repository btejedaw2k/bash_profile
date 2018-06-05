include bash_profile

bash_profile::config { 'profile1.sh':
  source => '/tmp/test1/testing',
}