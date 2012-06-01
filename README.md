Symfony-Bootstrap Edition
=========================

This is the Standatd Edition of symfony enriched with twitters/bootstrap by using the MopaBootstrapBundle
Its intended to kickstart your development and as an alternative to symfony-standard edition (https://github.com/symfony/symfony-standard/tree/master/web) which it is also based on!

Before we begin install symfony-bootstrap itself, we need to do the following:

- [composer](http://getcomposer.org)
- [node.js](http://nodejs.org)
- [Less installation](https://github.com/phiamo/MopaBootstrapBundle/blob/master/Resources/doc/less-installation.md) (Mac users please note the known issues at the bottom of the Less installation instructions)

To install it just:

```
git clone git://github.com/phiamo/symfony-bootstrap.git
cd symfony-bootstrap
cp app/config/parameters.yml.default app/config/parameters.yml
composer.phar install
app/console assetic:dump
```


What it is made of
------------------

- [Symfony2](http://symfony.com/) - Symfony2
- [bootstrap](http://github.com/twitter/bootstrap) - Twitter's Bootstrap
- [MopaBootstrapBundle](http://github.com/phiamo/MopaBootstrapBundle) - Easy integration of twitters bootstrap into symfony2
- [MopaBootstrapSandboxBundle](http://github.com/phiamo/MopaBootstrapSandboxBundle) - Seperate live docs from code


There is a live preview available here: 
    http://bootstrap.mohrenweiserpartner.de/mopa/bootstrap
    
So it should work, "out of the box", but if it doesnt, open issues make PR's etc.
