# Define: bash_profile::config
#
# Parameters:
#   [*source*]
#     This is where the contest to be pased on the file is going to be stred
#     Default: undef
#
#   [*file_ensure*]
#     This is to ensure the file exist
#     Defatul: present
#
#   
#   [*file_directory*]
#     this is the direcory where the file is going to be saved
#     Default: /etc/profile.d
#
#   [*file_parent_name*]
#     This is the parrent file of the confuration for the OS
#     Default: /etc/profile
#
#   [*account*]   
#     This is the OS user accoint .bashprofile you what to change
#     If this variable is not set the module will undertand that the file to edit us under /etc/profile
#     Default: undef
#
#   [*account_dir*]
#     Directory whare the bash profile file will be saved.
#     Defaul: undef
#
#

define bash_profile::config (
  Optional[String]          $source           = undef,
  Optional[String]          $account          = undef,
  Optional[String]          $account_dir      = undef,
) {

  include bash_profile

  if ($source == undef){
    warning( 'There is not source to create bash profile, please insert a source' )
  }
  else {

    $set_file_directory = $account ? {
      undef   => $bash_profile::file_directory,
      default => "/home/${account}",
    }

    $real_file_directory = $account_dir ? {
      undef   => $set_file_directory,
      default => $account_dir,
    }

    if $account == undef {
      file { "${real_file_directory}/${name}":
        ensure  => $bash_profile::file_ensure,
        source  => $source,
        require => File[$bash_profile::file_parent_name],
      }
    }
    else {
      file { "${real_file_directory}/.${name}":
        ensure => $bash_profile::file_ensure,
        source => $source,
      }
    }

  }
}