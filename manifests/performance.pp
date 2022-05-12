# Class galera::performance
# Configure settings to adjust the performance before starting the service
class galera::performance(
  $mariadb_max_open_files = $galera::mariadb_max_open_files,
) {
  file {'/etc/systemd/system/mariadb.service.d/':
    ensure  => directory,
    recurse => true,
  }
  file_line{'service_section':
    path => '/etc/systemd/system/mariadb.service.d/max-open-files.conf',
    line => '[Service]',
  }
  file_line{'max_open_files':
    path  => '/etc/systemd/system/mariadb.service.d/max-open-files.conf',
    line  => "LimitNOFILE=${mariadb_max_open_files}",
    match => '^LimitNOFILE=',
    after => '\[Service\]',
  }
}
