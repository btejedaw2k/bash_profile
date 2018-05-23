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
  String    $file_ensure          = 'present'
  String    $file_template        = 'profile_template.erb',
  String    $file_parent_file     = '/etc/profile',
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