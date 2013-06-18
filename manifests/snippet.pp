# Public: Create a snippet file
#
# namevar - The snippet filename
#
# Examples
#
#   dotfiles::snippet { 'foo': }
define dotfiles::snippet($ensure = present) {
  file { "${dotfiles::home}/.snippets/${name}.snippets":
    ensure  => $ensure,
    source  => "puppet:///modules/dotfiles/snippets/${name}.snippets",
    require => File["${dotfiles::home}/.bin"]
  }
}
