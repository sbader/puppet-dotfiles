# Public: Install Dotfiles
#
# Examples
#
#   include dotfiles
class dotfiles {
  $home = "/Users/${::boxen_user}"

  dotfile { ['gitignore', 'vimrc', 'zshrc', 'gitconfig', 'gvimrc', 'hushlogin', 'slate', 'tmux.conf']: }

  file { "${home}/.bin":
    ensure => 'directory'
  }

  bin { ['vi', 'vim', 'vm']: }

  file { "${home}/.snippets":
    ensure => 'directory'
  }

  snippet { ['all', 'coffee', 'rails', 'ruby', 'sh', 'snippets', 'vim', 'xdebug']: }
}
