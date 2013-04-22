class { 'apt':
  always_apt_update    => true
}
Exec { path => ['/usr/local/bin', '/opt/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'], logoutput => true }

Package { require => Exec['apt_update'], }

$webserverService = $webserver ? {
    apache2 => 'httpd',
    nginx => 'nginx',
    default => 'nginx'
}

host { 'localhost':
    ip => '127.0.0.1',
    host_aliases => ["localhost.localdomain",
                     "localhost4", "localhost4.localdomain4", "$vhost.dev"],
    notify => Service[$webserverService],
}

class { "mysql": }
class { "mysql::server":
    config_hash => {
        "root_password" => $vhost,
        "etc_root_password" => true,
    }
}
Mysql::Db {
    require => Class['mysql::server', 'mysql::config'],
}

include app::database
include app::php
include app::webserver
include app::tools

class { "java": }

class { "nodejs": }

package { 'less':
  ensure   => '1.3.3',
  provider => 'npm',
}
class {"composer":
  target_dir      => '/usr/local/bin',
  composer_file   => 'composer',
  download_method => 'curl', # download methods are curl or wget
  logoutput       => false
}
