#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_vim() {
	print_subheader "Vim"

	uninstall_package "vim"
	install_package "gettext"
  install_package "libncurses5-dev"
  install_package "lua5.2"
  install_package "lua5.2-dev"
  install_package "luajit"
  install_package "python-dev"

  print_info "Compile vim from source"
  cd "/usr/local/src"
  sudo git clone https://github.com/vim/vim.git > /dev/null 2>&1
  cd "vim"

  sudo make distclean
  sudo make clean
	sudo ./configure --prefix=/usr/local \
    --enable-multibyte \
    --with-features=huge \
    --enable-luainterp \
    --with-lua-prefix=/usr \
    --enable-pythoninterp \
    --enable-cscope \
    --enable-fail-if-missing
	sudo make
  sudo make install

  cd "$(dirname "${BASH_SOURCE[0]}")"

  print_info "Install dein.vim"
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
  chmod +x ~/installer.sh
  sh ~/installer.sh ~/.vim > /dev/null 2>&1
  print_success "Vim installed"
}

