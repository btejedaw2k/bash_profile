# Class: filewrite
#
#
#
# Parameters:
#   [*file_path*]
#     This is the file path to write this resourse file will 
#     Default: '/etc/profile.d/sandals_profile.sh'
#
#   [*file_name*]
#     This is the file name to write this resourse file will 
#     Default: '/etc/profile.d/sandals_profile.sh'
#
#   [*file_ensure*]
#     This is to ensure the file exist
#     Defatul: present
#
#   [*file_owner*]
#     User owner of the file
#     Defatul: root
#
#   [*file_group*]
#     Group owner of the file
#     Defatul: root
#
#   [*file_mode*]
#     Mode of the file for permitions
#     Default: 0644

class bash_profile (
    String    $file_parent_file     = '/etc/profile',
    String    $file_path            = '/etc/profile.d',
    String    $file_source_path     = undef,
    String    $file_names           = {},
    String    $file_ensure          = 'present',
    String    $file_owner           = 'root',
    String    $file_group           = 'root',
    String    $file_mode            = '0644',
    String    $file_template        = 'profile_template.erb',
) {
  File {
    ensure  =>  $file_ensure,
    group   =>  $file_group,
    owner   =>  $file_owner,
    mode    =>  $file_mode,
  }
  # resources file master
  file { $file_parent_file:
    content =>  template("${module_name}/${file_template}"),
  }
  $file_names.each |$index, $file_name| {
    # resources config file
    file { "${file_path}/${file_name}.sh":
      source  => "${file_source_path}/${file_name}",
      require => file[$file_parent_file],
    }
     
  }
}