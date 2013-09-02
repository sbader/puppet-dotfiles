# Public: Create a zsh completion file
#
# namevar - The completion name
#
# Examples
#
#   dotfiles::zsh_completion { 'foo': }
define dotfiles::zsh_completion($ensure = present) {
  file { "${dotfiles::home}/.zsh/completions/_${name}":
    ensure  => $ensure,
    source  => "puppet:///modules/dotfiles/zsh_completions/${name}",
    require => File["${dotfiles::home}/.zsh/completions"]
  }
}

