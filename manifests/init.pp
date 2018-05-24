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
#     Default: 0644
#
#   [*file_parent_file*]
#     Mode of the file for permitions
#     Default: 0644

class bash_profile (
  Enum['present', 'absent']   $file_ensure      = 'present',
  Optional[String]            $file_template    = 'profile_template.erb',
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

  $config_files.each |String $key, Hash $value| {
    file { "${file_directory}/${key}":
      *       => $value,
      require => File[$file_parent_name],
    }
  }
}