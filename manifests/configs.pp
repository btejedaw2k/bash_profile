# Class: bash_profile::config
#
#
class bash_profile::configs (
  Hash  $config_files = {},
){

  $configs = lookup('bash_profile::configs', Hash, {'strategy' => 'deep', 'merge_hash_arrays' => true}, $config_files)

  if !empty($configs) {
    create_resources('bash_profile::conf', $configs)
  }
}