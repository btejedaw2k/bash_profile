
class { 'bash_profile::config':
	source => "puppet:///modules/profile/profile.d/testuser.sh"
	
}