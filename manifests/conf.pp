# Define: bash_profile::conf
# Parameters:
# arguments
#
define bash_profile::conf (
  String  $file_parent_file = '/etc/profile',
  String  $source           = undef,
  String  $file_ensure      = 'present',
  String  $file_type        = 'sh',
) {
  # puppet code

  include ::bash_profile

  file { "/etc/profile.d/${name}.${file_type}":
    notify => $name,
    source => $source,
  }
}