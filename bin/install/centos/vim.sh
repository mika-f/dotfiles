#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

sudo yum remove -y -q -e 0 vim
install_package "lua"
install_package "lua-devel"
install_package "ncurses-devel"

print_info "Compile vim from source"
cd "/usr/local/src"
sudo git clone https://github.com/vim/vim.git
cd "vim"
git pull

sudo make distclean
sudo make clean
sudo ./configure --prefix=/usr/local \
  --enable-multibyte \
  --with-features=huge \
  --enable-luainterp \
  --with-lua-prefix=/usr \
  --enable-cscope \
  --enable-fail-if-missing
sudo make
sudo make install


