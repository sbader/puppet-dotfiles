# Public: Create dotfile
#
# namevar - The dotfile filename
#
# Examples
#
#   dotfiles::dotfile { 'foo': }
define dotfiles::dotfile($ensure = present) {
  file { "${dotfiles::home}/.${name}":
    ensure => $ensure,
    source => "puppet:///modules/dotfiles/${name}"
  }
}
