class weechat (
  $placeholder = $weechat::params::placeholder,
) inherits weechat::params {
  include weechat::install
}
