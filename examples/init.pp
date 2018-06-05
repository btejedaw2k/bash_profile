class { 'bash_profile':
	'config_files' => {
		'profile1.sh' => { 'source' => "/tmp/test1/testing" },
		'testaccountprof' => { 'source' => "/tmp/test1/testing1", 'account' => "testaccount", 'account_dir' => "/home/testaccount"},
	}
}