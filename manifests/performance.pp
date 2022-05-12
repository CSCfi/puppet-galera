# Class galera::performance
# Configure settings to adjust the performance before starting the service
class galera::performance(
  $mariadb_max_open_files = $galera::mariadb_max_open_files,
) {
  file {'/etc/systemd/system/mariadb.service.d/':
    ensure  => directory,
    recurse => true,
  }
  ini_settings{'max_open_files':
    path    => '/etc/systemd/system/mariadb.service.d/max-open-files.conf',
    section => 'Service',
    setting => 'LimitNOFILE',
    value   => $mariadb_max_open_files,
  }
}
