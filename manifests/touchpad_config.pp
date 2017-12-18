# Class: xorg::touchpad_config
# ===========================
#
# Full description of class xorg::touchpad_config here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'xorg::touchpad_config':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class xorg::touchpad_config (
  String $ensure = "present",
	String $tapping = 'on',
  String $clickmethod = 'clickfinger',
  Boolean $naturalscrolling = false,
  Boolean $disablewhiletyping = true,
)
{

	file {'xorg touchpad config file':
    ensure  => present,
    path    => '/etc/X11/xorg.conf.d/30-touchpad.conf',
    content => template('xorg/touchpad.erb'),
    require => Package['xorg-server']
  }

}
