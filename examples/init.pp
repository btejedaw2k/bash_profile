config_files = {
  'profile1.sh' => {'source' => '/tmp/test1/testing' },
  'testaccount' => { 'source' => '/tmp/test1/testaccount', 'account' => 'testaccount', 'account_dir' => '/home/testaccount'},
}

class { 'bash_profile':
  config_files => $config_files
}
