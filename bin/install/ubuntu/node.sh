#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_node() {
  print_subheader "Node.js"

  ask "Would you install Node.js?"
  if get_answer; then
    cd "/usr/local/src"
    sudo git clone https://github.com/tj/n.git
    cd n
    sudo make install
    sudo n latest

    sudo npm install -g yarn gulp

    cd "$(dirname "${BASH_SOURCE[0]}")"
    print_success "Node.js installed"
  else
    print_info "Skip install Node.js"
  fi
}

