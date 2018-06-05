class { 'bash_profile':
	'config_files' => {
		'profile1.sh' => { 'source' => "puppet:///modules/profile/profile.d/testuser.sh" },
		'testaccountprof' => { 'source' => "puppet:///modules/profile/profile.d/testuser.sh", 'account' => "testaccount", 'account_dir' => "/home/testaccount"},
	}
}