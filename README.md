Symfony-Bootstrap Edition
=========================

This is the Standard Edition of [Symfony2](http://symfony.com/) enriched with [twitters/bootstrap](http://github.com/twitter/bootstrap), by using the [MopaBootstrapBundle](http://github.com/phiamo/MopaBootstrapBundle).
It is intended to kickstart your development, serving as an alternative to [symfony-standard edition](https://github.com/symfony/symfony-standard/tree/master/web), which is what symfony-bootstrap is based on!

There is a live preview available here: 
    http://bootstrap.mohrenweiserpartner.de/mopa/bootstrap

Packagist link:
    https://packagist.org/packages/mopa/symfony-framework-bootstrap-edition

What it is made of
------------------

Symfony-Bootstrap depends on the following projects:

- [Symfony2](http://symfony.com/) - Symfony2
- [bootstrap](http://github.com/twitter/bootstrap) - Twitter's Bootstrap
- [MopaBootstrapBundle](http://github.com/phiamo/MopaBootstrapBundle) - Easy integration of twitters bootstrap into symfony2
- [MopaBootstrapSandboxBundle](http://github.com/phiamo/MopaBootstrapSandboxBundle) - Seperate live docs from code



Installation in a Vagrant box (recommended)
-------------------------------------------

This feature comes from https://github.com/seiffert/symfony-vagrant
Thanks seiffert, i just included the vagrant folder from there and added a few puppet modules
This installs a complete linux setup including nodejs less java css

- Install vagrant on your system
  see [vagrantup.com](http://vagrantup.com/v1/docs/getting-started/index.html)
  
- Get a base box with puppet support
  see [http://www.vagrantbox.es/ list](http://www.vagrantbox.es/)
  e.g. http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box
  add it to your system: vagrant box add ubuntu-server-1204 http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box

- Install composer on your system
  see [getcomposer.org](http://getcomposer.org/doc/00-intro.md)

```
# clone the symfony-bootstrap edition:
git clone https://github.com/phiamo/symfony-bootstrap.git
# enter directory
cd symfony-bootstrap
# init submodules
git submodule init
# update submodules
git submodule update
# copy default parameters to local parameters
cp app/config/parameters.yml.default app/config/parameters.yml
# tell composer to install including dev (BootstrapSandboxBundle)
composer.phar install --dev
# enter vagrant dir
cd vagrant
# copy Personalization.dist to Personalization
cp Personalization.dist Personalization
# modify to your needs
# take the vm up
vagrant up
# wait until everything is setup, might take some mins on my quite fast system with ssd takes around 5 mins (downloading java, nodejs, etc)
# go to your browser
# http://192.168.10.42/app_dev.php
```

Installation on a Host System
-----------------------------

Before installing symfony-bootstrap, the following needs to be installed beforehand:

- [composer](http://getcomposer.org)
- [node.js](http://nodejs.org)
- [Less installation](https://github.com/phiamo/MopaBootstrapBundle/blob/master/Resources/doc/less-installation.md) (Mac users please note the known issues at the bottom of the Less installation instructions)

To install symfony-bootstrap, do the following:

```
git clone git://github.com/phiamo/symfony-bootstrap.git
cd symfony-bootstrap
cp app/config/parameters.yml.dist app/config/parameters.yml
curl -s https://getcomposer.org/installer | php
php composer.phar install --dev
app/console assetic:dump
```


It should now work. If you run into any issues, feel free to open a new issue or make a new pull request.

Next paragraphs are stolen from the original:

Welcome to the Symfony Standard Edition - a fully-functional Symfony2
application that you can use as the skeleton for your new applications.

This document contains information on how to download, install, and start
using Symfony. For a more detailed explanation, see the [Installation][1]
chapter of the Symfony Documentation.

1) Installing the Bootstrap Edition
----------------------------------

When it comes to installing the Symfony Standard Edition, you have the
following options.

### Use Composer (*recommended*)

As Symfony uses [Composer][2] to manage its dependencies, the recommended way
to create a new project is to use it.

If you don't have Composer yet, download it following the instructions on
http://getcomposer.org/ or just run the following command:

    curl -s http://getcomposer.org/installer | php

Then, use the `create-project` command to generate a new Symfony application:

    php composer.phar create-project symfony/framework-standard-edition path/to/install

Composer will install Symfony and all its dependencies under the
`path/to/install` directory.

### Download an Archive File

To quickly test Symfony, you can also download an [archive][3] of the Standard
Edition and unpack it somewhere under your web server root directory.

If you downloaded an archive "without vendors", you also need to install all
the necessary dependencies. Download composer (see above) and run the
following command:

    php composer.phar install

2) Checking your System Configuration
-------------------------------------

Before starting coding, make sure that your local system is properly
configured for Symfony.

Execute the `check.php` script from the command line:

    php app/check.php

The script returns a status code of `0` if all mandatory requirements are met,
`1` otherwise.

Access the `config.php` script from a browser:

    http://localhost/path/to/symfony/app/web/config.php

If you get any warnings or recommendations, fix them before moving on.

3) Browsing the Demo Application
--------------------------------

Congratulations! You're now ready to use Symfony.

From the `config.php` page, click the "Bypass configuration and go to the
Welcome page" link to load up your first Symfony page.

You can also use a web-based configurator by clicking on the "Configure your
Symfony Application online" link of the `config.php` page.

To see a real-live Symfony page in action, access the following page:

    web/app_dev.php/demo/hello/Fabien

4) Getting started with Symfony
-------------------------------

This distribution is meant to be the starting point for your Symfony
applications, but it also contains some sample code that you can learn from
and play with.

A great way to start learning Symfony is via the [Quick Tour][4], which will
take you through all the basic features of Symfony2.

Once you're feeling good, you can move onto reading the official
[Symfony2 book][5].

A default bundle, `AcmeDemoBundle`, shows you Symfony2 in action. After
playing with it, you can remove it by following these steps:

  * delete the `src/Acme` directory;

  * remove the routing entry referencing AcmeDemoBundle in `app/config/routing_dev.yml`;

  * remove the AcmeDemoBundle from the registered bundles in `app/AppKernel.php`;

  * remove the `web/bundles/acmedemo` directory;

  * remove the `security.providers`, `security.firewalls.login` and
    `security.firewalls.secured_area` entries in the `security.yml` file or
    tweak the security configuration to fit your needs.

What's inside?
---------------

The Symfony Standard Edition is configured with the following defaults:

  * Twig is the only configured template engine;

  * Doctrine ORM/DBAL is configured;

  * Swiftmailer is configured;

  * Annotations for everything are enabled.

It comes pre-configured with the following bundles:

  * **FrameworkBundle** - The core Symfony framework bundle

  * [**SensioFrameworkExtraBundle**][6] - Adds several enhancements, including
    template and routing annotation capability

  * [**DoctrineBundle**][7] - Adds support for the Doctrine ORM

  * [**TwigBundle**][8] - Adds support for the Twig templating engine

  * [**SecurityBundle**][9] - Adds security by integrating Symfony's security
    component

  * [**SwiftmailerBundle**][10] - Adds support for Swiftmailer, a library for
    sending emails

  * [**MonologBundle**][11] - Adds support for Monolog, a logging library

  * [**AsseticBundle**][12] - Adds support for Assetic, an asset processing
    library

  * **WebProfilerBundle** (in dev/test env) - Adds profiling functionality and
    the web debug toolbar

  * **SensioDistributionBundle** (in dev/test env) - Adds functionality for
    configuring and working with Symfony distributions

  * [**SensioGeneratorBundle**][13] (in dev/test env) - Adds code generation
    capabilities

  * **AcmeDemoBundle** (in dev/test env) - A demo bundle with some example
    code

All libraries and bundles included in the Symfony Standard Edition are
released under the MIT or BSD license.

Enjoy!

[1]:  http://symfony.com/doc/2.3/book/installation.html
[2]:  http://getcomposer.org/
[3]:  http://symfony.com/download
[4]:  http://symfony.com/doc/2.3/quick_tour/the_big_picture.html
[5]:  http://symfony.com/doc/2.3/index.html
[6]:  http://symfony.com/doc/2.3/bundles/SensioFrameworkExtraBundle/index.html
[7]:  http://symfony.com/doc/2.3/book/doctrine.html
[8]:  http://symfony.com/doc/2.3/book/templating.html
[9]:  http://symfony.com/doc/2.3/book/security.html
[10]: http://symfony.com/doc/2.3/cookbook/email.html
[11]: http://symfony.com/doc/2.3/cookbook/logging/monolog.html
[12]: http://symfony.com/doc/2.3/cookbook/assetic/asset_management.html
[13]: http://symfony.com/doc/2.3/bundles/SensioGeneratorBundle/index.html
