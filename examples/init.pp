class { 'bash_profile':
  config_files => {
    'profile1.sh' => {'source' => '/tmp/test1/testing' },
    'testaccount' => { 'source' => '/tmp/test1/testing2', 'account' => 'testaccount', 'account_dir' => '/home/testaccount'},
  }
}
