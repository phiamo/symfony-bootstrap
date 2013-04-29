class app::php {
    package {["php5", "php5-dev", "php-apc", "php5-mysql", "php5-suhosin", "php5-cli"]:
        ensure => present,
        notify => Service[$webserverService],
    }

    if 'nginx' == $webserver {
        include app::php::fpm
    }
}
