#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_ruby() {
  print_header "* Ruby"

  ask "Would you install Ruby?"
  if get_answer; then
    install_package "bzip2"
    install_package "libyaml-devel"
    install_package "libffi-devel"
    install_package "readline-devel"
    install_package "gdbm-devel"

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    CONFIGURE_OPS="--disable-install-rdoc" rbenv install 2.3.1
    rbenv rehash
    rbenv global 2.3.1

    gem install bundler --no-ri --no-rdoc

    print_success "Ruby installed"
  else
    print_info "Skip install Ruby"
  fi
}
