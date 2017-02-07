#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_tmux() {
	print_subheader "tmux"

	uninstall_package "vim"
	install_package "automake"
  install_package "libevent-dev"

  print_info "Compile vim from source"
  cd "/usr/local/src"
  sudo git clone https://github.com/tmux/tmux.git > /dev/null 2>&1
  cd "tmux"

  sudo ./autogen.sh
  sudo ./configure
  sudo make
  sudo make install

  cd "$(dirname "${BASH_SOURCE[0]}")"

  print_success "Vim installed"
}

