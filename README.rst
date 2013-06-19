A puppet module for managing logstash indexers and web instances on Ubuntu using
Upstart.

Disclaimer
==========

This module has been setup with hard-coded values to run the indexer
and web instance on the same box. I am working to improve that and make
it more flexible.

Pull requests are welcome!

Dependencies
============

This module requires that you have a redis server setup on the same server as
the indexer. I have been using "thomasvandoren/redis". 

I will work to add this as a parameter.

Usage
======

This sets up a logstash indexer:

::

    class my::host {
        
        class {'logstash::indexer': }
        
    }


This sets up a logstash web instance:

::

    class my::host {
        
        class {'logstash::web': }
        
    }


Credit
======

This module was derived mostly from `garethr/puppet-logstash`_
.. _`garethr/puppet-logstash`: https://github.com/garethr/garethr-logstash

Contributers
============

- @malthe
- @sherzberg
