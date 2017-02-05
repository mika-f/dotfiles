#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"

# install_package "git"
install_package() {
  if is_installed "$1"; then
    print_info "$1 has already installed."
  else
    print_info "Installing $1..."
    sudo apt-get install -y -q "$1"
    print_success "$1 install success."
  fi
}

uninstall_package() {
  if is_installed "$1"; then
    sudo apt-get remove -y -q "$1"
  fi
}

# install repo ppa:~
install_repo() {
  sudo apt-add-repository "ppa:$1"
}

is_installed() {
  sudo apt show "$1" &> /dev/null 
}

update() {
  # sudo yum update -y -q -e 0
  sudo apt-get update -q 
}

