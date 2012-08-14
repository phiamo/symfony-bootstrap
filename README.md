Symfony-Bootstrap Edition
=========================

This is the Standard Edition of [Symfony2](http://symfony.com/) enriched with [twitters/bootstrap](http://github.com/twitter/bootstrap), by using the [MopaBootstrapBundle](http://github.com/phiamo/MopaBootstrapBundle).
It is intended to kickstart your development, serving as an alternative to [symfony-standard edition](https://github.com/symfony/symfony-standard/tree/master/web), which is what symfony-bootstrap is based on!

There is a live preview available here: 
    http://bootstrap.mohrenweiserpartner.de/mopa/bootstrap

What it is made of
------------------

Symfony-Bootstrap depends on the following projects:

- [Symfony2](http://symfony.com/) - Symfony2
- [bootstrap](http://github.com/twitter/bootstrap) - Twitter's Bootstrap
- [MopaBootstrapBundle](http://github.com/phiamo/MopaBootstrapBundle) - Easy integration of twitters bootstrap into symfony2
- [MopaBootstrapSandboxBundle](http://github.com/phiamo/MopaBootstrapSandboxBundle) - Seperate live docs from code

Installation
------------------

Before installing symfony-bootstrap, the following needs to be installed beforehand:

- [composer](http://getcomposer.org)
- [node.js](http://nodejs.org)
- [Less installation](https://github.com/phiamo/MopaBootstrapBundle/blob/master/Resources/doc/less-installation.md) (Mac users please note the known issues at the bottom of the Less installation instructions)

To install symfony-bootstrap, do the following:

```
git clone git://github.com/phiamo/symfony-bootstrap.git
cd symfony-bootstrap
cp app/config/parameters.yml.default app/config/parameters.yml
curl -s https://getcomposer.org/installer | php
composer.phar install
app/console assetic:dump
```

It should now work. If you run into any issues, feel free to open a new issue or make a new pull request.
