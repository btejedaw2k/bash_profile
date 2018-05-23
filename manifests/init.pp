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
  String    $file_ensure      = 'present',
  String    $file_template    = 'profile_template.erb',
  String    $file_parent_file = '/etc/profile.d'
  String    $file_type        = 'sh',
  Hash      $config_files     = {},
) {
  File {
    ensure    => $file_ensure,
    group     => 'root',
    owner     => 'root',
    mode      => '0644',
  }
  file { $file_parent_file:
    content =>  template("${module_name}/${file_template}"),
  }
  $config_files.each |String $key, Hash $value| {
    file { "${file_parent_file}/${key}.${file_type}":
      *       => $value,
    }
    #  resources file master
  }
}