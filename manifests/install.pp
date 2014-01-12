class weechat::install inherits weechat {
  package { [
             'weechat',
             'weechat-curses',
             'weechat-plugins'
             ]:
               ensure => latest,
  }
}
