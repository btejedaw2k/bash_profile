include bash_profile

bash_profile::config { 'profile1.sh':
  source => '/tmp/test1/testing',
  file_ensure => 'present',
  file_directory => '/etc/profile.d',
  file_parent_name => '/etc/profile',
}