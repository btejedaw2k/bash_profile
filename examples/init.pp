class { 'bash_profile':
  config_files => {
    'profile1.sh' => {'source' => '/tmp/test1/testing' },
    'test' => { 'source' => '/tmp/test1/testing2', 'account' => 'testuser', 'account_dir' => '/home/testuser'},
  }
}
