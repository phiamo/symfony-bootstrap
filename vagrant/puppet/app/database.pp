class app::database {

    mysql::db { $vhost:
      user     => $vhost,
      password => $vhost,
    }

    exec {"db-drop":
        require => [Package["php5-cli"], Class["composer"], Database["$vhost"]], 
        command => "/bin/bash -c 'cd /srv/www/vhosts/$vhost.dev && /usr/bin/php app/console doctrine:schema:drop --force || exit 0'",
    }

    exec {"db-setup":
        require => Exec["db-drop"],
        command => "/bin/bash -c 'cd /srv/www/vhosts/$vhost.dev && /usr/bin/php app/console doctrine:schema:create'",
    }

    exec {"db-default-data":
        require => Exec["db-setup"],
        command => "/bin/bash -c 'cd /srv/www/vhosts/$vhost.dev && /usr/bin/php app/console doctrine:fixtures:load'",
        onlyif => "/usr/bin/test -d /srv/www/vhosts/$vhost.dev/src/*/*/DataFixtures",
    }
}
