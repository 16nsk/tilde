#!/bin/bash

ln -sv $PWD/bin/ $HOME/bin
ln -sv $PWD/lib/ $HOME/lib

#######################
#  System
#######################

# I want Apache to run along with Pow.cx. We need to install a VirtualHost to
# handle it.
sudo ln -sfv $PWD/etc/apache2/other/zzz_pow.conf /etc/apache2/other/zzz_pow.conf
sudo apachectl restart


#######################
#  Ruby
#######################
ln -sfv $PWD/.gemrc $HOME/.gemrc
ln -sfv $PWD/.rdebugrc $HOME/.rdebugrc
ln -sfv $PWD/.pryrc $HOME/.pryrc


#######################
#  BASH
#######################
ln -sfv $PWD/.bash_profile $HOME/.bash_profile


#######################
#  ACK
#######################
ln -sfv $PWD/.ackrc $HOME/.ackrc


#######################
#  GIT
#######################

# A couple of things for Git that we want to be user global. Note that we
# should NOT link .git and .gitmodules as these belong to this project and are
# not intended to be in my user directory.
ln -sfv $PWD/.gitconfig $HOME/.gitconfig
ln -sfv $PWD/.gitignore $HOME/.gitignore
ln -sfv $PWD/.svnauthors $HOME/.svnauthors
ln -sFfv $PWD/.gittemplate $HOME

# Fetch latest
curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -L -o $PWD/lib/git-completion.bash
curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -L -o $PWD/lib/git-prompt.sh


#######################
#  VIM
#######################
ln -sv $PWD/.vim/ $HOME/.vim
ln -sfv $PWD/.vimrc $HOME/.vimrc
ln -sfv $PWD/.gvimrc $HOME/.gvimrc


#######################
#  rbenv
#######################
ln -sv $PWD/.rbenv/plugins/ $HOME/.rbenv/plugins

# Pull in our .vim/bundles, .rbenv/plugins
git submodule update --init


#######################
#  Rails
#######################
ln -sfv $PWD/.railsrc $HOME/.railsrc
