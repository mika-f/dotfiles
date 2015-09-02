#!/bin/sh

# VIM Installation & Configuration Script

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

install_unless_installed git
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
./configure --prefix=/usr/local --with-features=huge --enable-multibyte --enable-rubyinterp --enable-luainterp --enable-cscope --enable-fail-if-missing
make
sudo make install

cd ~
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

