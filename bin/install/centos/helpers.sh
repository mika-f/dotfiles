#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"

# install_package "git"
install_package() {
  if is_installed "$1"; then
    print_info "$1 has already installed."
  else
    # print_info "Installing $1..."
    sudo yum install -y -q -e 0 "$1"
    # print_success "$1 install success."
  fi
}

# install_repo "http://~"
install_repo() {
  cd /etc/yum.repos.d/
  sudo wget "$1"

  cd "$(dirname "${BASH_SOURCE[0]}")"
}

is_installed() {
  yum list installed "$1" &> /dev/null
}

update() {
  sudo yum update -y -q -e 0
}

