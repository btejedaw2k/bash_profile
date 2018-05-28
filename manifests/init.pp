# Class: filewrite
#
#
#
# Parameters:
#
#   [*file_ensure*]
#     This is to ensure the file exist
#     Defatul: present
#
#   [*file_template*]
#     default template for the class
#     Default: undef
#
#   [*file_parent_name*]
#     This is the parrent file of the confuration for the OS
#     Default: /etc/profile
#
#   [*file_directory*]
#     this is the direcory where the file is going to be saved
#     Default: /etc/profile.d
#
#   [*config_files*](Hash)
#     This variable will store all the source and and acount to be change including the path
#     where the file is going to be sorted
#     Default: empty
#

class bash_profile (
  Enum['present', 'absent']   $file_ensure      = 'present',
  Optional[String]            $file_template    = undef,
  String                      $file_parent_name = '/etc/profile',
  String                      $file_directory   = '/etc/profile.d',
  Optional[Hash]              $config_files,
) {
  File {
    ensure    => $file_ensure,
    group     => 'root',
    owner     => 'root',
    mode      => '0644',
  }

  $file_template_content = $file_template  ? {
    undef => "${module_name}/profile_template.erb",
    default => $file_template,
  }

  file { $file_parent_name:
    content =>  template($file_template_content),
  }

  $configs = lookup('bash_profile::configs', Hash, {'strategy' => 'deep', 'merge_hash_arrays' => true}, $config_files)

  if !empty(configs) {
    create_resources('bash_profile::config', $configs)
  }
}