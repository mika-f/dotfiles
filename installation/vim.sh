#!/bin/sh

# VIM Build, Installation & Configuration Script

# Depend: ruby.sh, install.sh 

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

install_unless_installed git
install_unless_installed lua
install_unless_installed lua-devel
install_unless_installed ncurses-devel

cd ~

# git clone https://github.com/vim/vim.git
# cd vim
# git fetch
# git merge
hg clone https://vim.googlecode.com/hg vim
cd vim
hg pull
hg update

# cd src
make distclean
make clean
./configure --prefix=/usr/local \
        --enable-multibyte --with-features=huge \
        --enable-luainterp --with-lua-prefix=/usr \
        --enable-rubyinterp=yes \
        --enable-cscope --enable-fail-if-missing
make
sudo make install

cd ~
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

