class app::symfony {
    exec {"clear-symfony-cache":
        require => Exec["db-default-data"],
        command => "sudo /bin/bash -c 'cd /srv/www/vhosts/$vhost.dev && /usr/bin/php app/console cache:clear --env=dev && /usr/bin/php app/console cache:clear --env=prod'",
    }
}
