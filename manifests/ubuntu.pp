class weechat::ubuntu inherits weechat {
  if $install_upstream_packages {
    apt_key { 'puppetlabs':
      ensure => 'present',
      id     => '4573289D',
    }

    # BEWARE - This will allow unsigned packages to be installed on your system
    file { "/etc/apt/apt.conf.d/99auth":
      owner     => root,
      group     => root,
      content   => "APT::Get::AllowUnauthenticated yes;",
      mode      => 644,
    }

    apt::source { 'weechat':
      location    => 'http://ppa.launchpad.net/nesthib/weechat/ubuntu',
      repos       => 'main',
      include_src => false,
    }
  }

  if $install_upstream_packages and $install_devel_packages {
    package { [
               'weechat',
               'weechat-curses',
               'weechat-plugins'
               ]:
                 ensure => '1.1~dev+20141031~precise1',
    }
  } else {
    package { [
             'weechat',
             'weechat-curses',
             'weechat-plugins'
             ]:
               ensure => latest,
    }
  }
}
