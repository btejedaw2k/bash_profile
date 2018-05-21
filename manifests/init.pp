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

class conf (
    Optional[String]                            $file_parent_file       = '/etc/profile',
    Optional[String]                            $file_path              = '/etc/profile.d',
    Optional[String]                            $file_names             = [],
    Optional[String]                            $file_ensure            = 'present',
    Optional[String]                            $file_owner             = 'root',
    Optional[String]                            $file_group             = 'root',
    Optional[String]                            $file_mode              = '0644',
    Optional[String]                            $file_template          = 'profile_template.erb',
) {
  $file_names.each |String $file_name| {
    # resources config file
    file { "${file_path}/${file_name}":
      ensure  =>  $file_ensure,
      path    =>  "${file_path}/${file_name}",
      group   =>  $file_group,
      owner   =>  $file_owner,
      mode    =>  $file_mode,
      require =>  file[$file_parent_file],
    }
    # resources file master
    file { $file_parent_file:
      ensure  =>  file_ensure,
      path    =>  $file_parent_file,
      group   =>  $file_group,
      owner   ->  $file_owner,
      mode    =>  $file_mode,
      type    =>  'file',
      content =>  template("${module_name}/${file_template}"),
    }
  }
}