# Define: bash_profile::config
# Parameters:
# arguments:
#
define bash_profile::config (
  Optional[String]            $source           = undef,
  Enum['present', 'absent']   $file_ensure      = $bash_profile::file_ensure,
  Optional[String]            $file_directory   = $bash_profile::file_directory,
  Optional[String]            $file_parent_name = $bash_profile::file_parent_name,
  Optional[String]            $account          = undef,
) {

  if ($source == undef) or (file_name == undef) {
    warning( 'There is not source and or file name to create bash profile, please insert a source and a file name' )
  }
  else {

    $real_file_directory = $account ? {
      undef   => $file_directory,
      default => "/home/${account}",
    }

    warning( "${real_file_directory}/${name}" )
    file { "${real_file_directory}/${name}":
      ensure  => $file_ensure,
      source  => $source,
    }
  }
}