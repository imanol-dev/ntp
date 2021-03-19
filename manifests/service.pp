# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ntp::service
class ntp::service {

  $service_name = $facts['os']['family'] ? {
    'RedHat' => 'ntpd',
    'Debian' => 'ntp'
  }

  $service_running = $ntp::service_running ? {
    true  => running,
    false => stopped,
  }

  service { $service_name:
    ensure => $service_running,
    enable => $ntp::service_enabled
  }
}
