class { 'bash_profile':
  config_files => {
    'profile1.sh' => {'source' => '/tmp/test1/testing' },
    'btejeda' => { 'source' => '/tmp/test1/testing2', 'account' => 'btejeda', 'account_dir' => '/home/btejeda'},
  }
}
