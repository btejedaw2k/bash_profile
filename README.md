
# Bash Profile Module

Welcome Bash Profile management module. 
This module was generated wiht Pupped Developement Kit, see documentation on: https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README File provide information about how this module works

#### Table of Contents

1. [Description](#description)
2. [Usage - Configuration options and additional functionality](#usage)

## Description

#### Apply For RedHat and CentOS 6 & 7 (still under developer).

With this module you are able to add has many bash files you need into CentOS or RedHat /etc/profile.d/ directory that contains a specific script in how you need to be every ssh login to be formated, you can also edit the template of the /etc/profile file to have core change in the CentOS-RedHat general Profile.

The porpuse of the module is to have independent profiles costumizations under the /etc/profile.d/ directory including costumize the /etc/profile template that is by default under this module.

## Usage

### Warning
**This module will configure you bash profile configuration**

##### Load module
```puppet
include bash_profile
```
### Use bash_profile with puppet code

```puppet
class { 'bash_profile':
	'config_files' => {
		'profile1' => { 'source' => "<source where your bash profile script is located>" },
		'profile2' => { 'source' => "<source where your bash profile script is located>", 'account' => "<OS account>", 'account_dir' => "<directory of the account, not mandatory>"},
	}
}
```
### Hiera usage
```yaml
bash_profile::config_files:
  'profile1': 
    'source': "<source where your bash profile script is located>"
  'profile2':
    'source': "<source where your bash profile script is located>"
    'account': "<OS account>"
    'account_dir': "<directoru of the account, if the directory is diferent than /home/accountname>"
```
### Notes:
* For directory paths never end the string with a '/' symbol.
* By setting up the account name the default directory will be changed from /etc/profile.d to /home/accountname adding the file you named on each hiera variable for bash_profile::config_files.
* If the directory is diferent than the default /home/accountname you can specified the path or leave it blank for default configuration (/home/accountname).
* **Documentation:** profile1 and profile2 are the variable definition for the files names.
* You can repleace the **config_file** variable name for **configs** only with hiera to look like this: **bash_profile::configs**