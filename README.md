# UPDATE!

This repository is no longer in use by the Puppet SE Team, and will be official Archived on Friday, July 1st. It will then be deleted on Friday, July 15th. If you are using any of the included code in any way, please take efforts to preserver your access to the code at your earlier convenience.

Thanks!  - The Puppetlabs SE Team

# Profile Module #

[![Build Status](https://travis-ci.org/puppetlabs-seteam/puppet-module-profile.svg?branch=master)](https://travis-ci.org/puppetlabs-seteam/puppet-module-profile)

Profiles are intended to be aggregator Puppet classes that put together utility
modules to construct site-meaningful configurations. They deal with high-level
abstractions and glue them together. Multiple profiles may be deployed to a
single machine. Profiles are often the building blocks of Roles.

This is the profile module for the Puppet Labs TSE Team. It is a site-specific
module, and is not designed to plug-n-play into other environments. In some
ways, this is one of a few modules that _define_ the environment.
