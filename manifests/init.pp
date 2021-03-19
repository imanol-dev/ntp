# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ntp
class ntp (
  Boolean $package_installation,
  Boolean $service_running,
  Boolean $service_enabled,
  Array[String] $servers,
  String $logfile_path,
  String $logmode,
  String $driftfile_path,
) {
  contain ntp::install
  contain ntp::config
  contain ntp::service

  Class['::ntp::install']
  -> Class['::ntp::config']
  ~> Class['::ntp::service']
}
