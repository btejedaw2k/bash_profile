
# Bash Profile Module

Welcome Bash Profile management module. 
This module was generated wiht Pupped Developement Kit, see documentation on: https://puppet.com/pdk/latest/pdk_generating_modules.html .

The README File provide information about how this module works

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with profile](#setup)
    * [What profile affects](#what-profile-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with profile](#beginning-with-profile)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

#### Apply For RedHat and CentOS 6 & 7 (still under developer).

With this module you are able to add has many bash files you need into CentOS or RedHat /etc/profile.d/ directory that contains a specific script in how you need to be every ssh login to be formated, you can also edit the template of the /etc/profile file to have core change in the CentOS-RedHat general Profile.

The porpuse of the module is to have independent profiles costumizations under the /etc/profile.d/ directory including costumize the /etc/profile template that is by default under this module.

## Usage

### Warning
**This module will configure you bash profile configuration**

### Use bash_profile with puppet code

```puppet
class { 'bash_profile':
	config_files => {
		profile1 => { source => '<source where your bash profile script is located>' },
		profile2 => { source => '<source where your bash profile script is located>', account => '<OS account>'},
	}
}
```

### Hiera usage
```puppet
  bash_profile::config_files:
    'profile1':
      'source': '<source where your bash profile script is located>'
    'profile2':
      'source': '<source where your bash profile script is located>'
      'account': '<OS account>'
```
**By setting up the account name the default directory where the profile bash will be save change from /etc/profile.d/ to /home/accountname**
