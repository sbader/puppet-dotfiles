require 'spec_helper'

describe 'dotfiles' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end

  it do
    should contain_file('/Users/testuser/.bin')

    %w{ vi vim vm }.each do |name|
      should contain_file("/Users/testuser/.bin/#{name}")
    end

    should contain_file('/Users/testuser/.snippets')

    %w{ all coffee rails ruby sh snippets vim xdebug }.each do |name|
      should contain_file("/Users/testuser/.snippets/#{name}.snippets")
    end

    %w{ gitconfig gitignore gvimrc hushlogin slate tmux.conf vimrc zshrc }.each do |name|
      should contain_file("/Users/testuser/.#{name}")
    end
  end
end
