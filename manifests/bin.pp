# Public: Create a binary file
#
# namevar - The binary filename
#
# Examples
#
#   dotfiles::bin { 'foo': }
define dotfiles::bin($ensure = present) {
  file { "${dotfiles::home}/.bin/${name}":
    ensure  => $ensure,
    source  => "puppet:///modules/dotfiles/bin/${name}",
    require => File["${dotfiles::home}/.bin"]
  }
}
