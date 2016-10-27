#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_git() {
  print_subheader "Git"

  uninstall_package "git"
  install_package "curl-devel"
  install_package "expat-devel"
  install_package "gettext-devel"
  install_package "openssl-devel"
  install_package "zlib-devel"
  install_package "perl-ExtUtils-MakeMaker"

  print_info "Compile git from source"
  cd "/usr/local/src"
  sudo wget -o - "https://www.kernel.org/pub/software/scm/git/git-2.10.1.tar.gz"
  sudo tar xzf "git-2.10.1.tar.gz"

  cd "git-2.10.1"
  sudo make prefix=/usr/local all
  sudo make prefix=/usr/local install

  cd "$(dirname "${BASH_SOURCE[0]}")"
  print_success "Git installed"
}

