# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ntp::install
class ntp::install {
  if $ntp::package_installation == true {
    package { 'ntp':
      ensure => 'installed'
    }
  }
}
