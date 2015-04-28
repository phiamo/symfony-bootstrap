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


class { "java": }

class { "nodejs": }


include app::webserver
include app::php
include composer

composer::exec { 'bootstrap_update':
    cmd                  => 'update',  # REQUIRED
    cwd                  => "/srv/www/vhosts/$vhost.dev", # REQUIRED
    packages             => [], # leave empty or omit to update whole project
    prefer_source        => true, # Only one of prefer_source or prefer_dist can be true
    prefer_dist          => false, # Only one of prefer_source or prefer_dist can be true
    dry_run              => false, # Just simulate actions
    no_custom_installers => false, # No custom installers
    no_scripts           => false, # No script execution
    no_interaction       => true, # No interactive questions
    optimize             => false, # Optimize autoloader
    dev                  => false, # Install dev dependencies
}
include app::tools
include app::database
include app::symfony

package { 'less':
  ensure   => '1.3.3',
  provider => 'npm'
}
