class weechat (
  $install_upstream_packages = $weechat::params::install_upstream_packages,
  $install_devel_packages    = $weechat::params::install_devel_packages,
) inherits weechat::params {
  include weechat::install
}
