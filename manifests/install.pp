class weechat::install inherits weechat {
  if $install_upstream_packages {
    # BEWARE - This will allow unsigned packages to be installed on your system
    file { "/etc/apt/apt.conf.d/99auth":
      owner     => root,
      group     => root,
      content   => "APT::Get::AllowUnauthenticated yes;",
      mode      => 644,
    }

    apt::source { 'weechat':
      location    => 'http://debian.weechat.org',
      repos       => 'main',
      include_src => false,
    }
  }

  if $install_upstream_packages and $install_devel_packages {
    package { [
               'weechat-devel',
               'weechat-devel-curses',
               'weechat-devel-plugins'
               ]:
                 ensure => latest,
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
