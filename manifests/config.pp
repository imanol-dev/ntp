# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ntp::config
class ntp::config {

  file { '/etc/ntp.conf':
    ensure  => file,
    owner   => ntp,
    group   => ntp,
    mode    => '0644',
    content => epp('ntp/ntp.conf.epp', {
      'servers'        => $ntp::servers,
      'driftfile_path' => $ntp::driftfile_path,
    }),
  }

  file { '/var/log/ntp':
    ensure => directory,
    owner  => ntp,
    group  => ntp,
  }
  -> file { "/var/log/ntp/${$ntp::logfile_path}":
    ensure => file,
    owner  => ntp,
    group  => ntp,
    mode   => $ntp::logmode,
  }

}
