# Public: Install Dotfiles
#
# Examples
#
#   include dotfiles
class dotfiles {
  $home = "/Users/${::boxen_user}"

  dotfile { ['gitignore', 'vimrc', 'zshrc', 'gitconfig', 'gvimrc', 'hushlogin', 'slate', 'tmux.conf', 'powconfig', 'ackrc']: }

  file { "${home}/.bin":
    ensure => 'directory'
  }

  bin { ['vi', 'vim', 'vm']: }

  file { "${home}/.snippets":
    ensure => 'directory'
  }

  snippet { ['all', 'coffee', 'rails', 'ruby', 'sh', 'snippets', 'vim', 'xdebug']: }

  file { "${home}/.vim/colors":
    ensure => 'directory',
    recurse => true
  }

  file { "${dotfiles::home}/.vim/colors/candy-sbader.vim":
    ensure  => 'present',
    source  => "puppet:///modules/dotfiles/candy-sbader.vim",
    require => File["${dotfiles::home}/.vim/colors"]
  }

  file { "${home}/.zsh":
    ensure => 'directory'
  }

  file { "${home}/.zsh/completions":
    ensure => 'directory',
    recurse => true
  }

  file { "${home}/.localrc":
    ensure => 'present'
  }

  zsh_completion { ['hub']: }
}
