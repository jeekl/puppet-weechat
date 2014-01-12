#weechat

##Overview

Simple module that can install weechat, the IRC client. 


##Usage

Simply include the `weechat` class.

    include weechat

Set `$install_upstream_packages = true` to install unsigned packages built by
the weechat developers (or community). __Warning__ This will enable your system
to install packages from unsigned sources.

Set `$install_devel_packages = true` to install the development packages built
by the upstream developers. This requires that you've set
`$install_upstream_packages` to `true` before.

### Example

Example of how to do this in your site.pp:

    node just.let.me.chat.already.com' {
      class {'weechat':
        install_upstream_packages => true,
        install_devel_packages    => true,
      }
      include weechat
    }

##Limitations

This module is known to work with the following operating system families:

 - Debian 7.3 or newer

