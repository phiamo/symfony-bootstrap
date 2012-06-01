Symfony-Bootstrap Edition
=========================

This is the Standatd Edition of symfony enriched with twitters/bootstrap by using the MopaBootstrapBundle
Its intended to kickstart your development and as an alternative to symfony-standard edition (https://github.com/symfony/symfony-standard/tree/master/web) which it is also based on!

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

Before installing symfony-bootstrap itself, the following needs to be installed beforehand:

- [composer](http://getcomposer.org)
- [node.js](http://nodejs.org)
- [Less installation](https://github.com/phiamo/MopaBootstrapBundle/blob/master/Resources/doc/less-installation.md) (Mac users please note the known issues at the bottom of the Less installation instructions)

To install symfony-bootstrap, do the following:

```
git clone git://github.com/phiamo/symfony-bootstrap.git
cd symfony-bootstrap
cp app/config/parameters.yml.default app/config/parameters.yml
composer.phar install
app/console assetic:dump
```
    
So it should now work, but if it doesnt, open issues make PR's etc.
