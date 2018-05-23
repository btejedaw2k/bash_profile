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
    String    $file_template        = 'profile_template.erb',
    String    $file_parent_file     = '/etc/profile',
    String    $file_ensure          = 'present'
) {
  File {
    ensure  =>  $file_ensure,
    group   =>  'root',
    owner   =>  'root',
    mode    =>  '0644',
  }
  # resources file master
  file { $file_parent_file:
    content =>  template("${module_name}/${file_template}"),
  }
}