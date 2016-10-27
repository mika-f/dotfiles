#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

print_header "* Git"

sudo yum remove -y -q -e 0 git
install_package "curl-devel"
install_package "expat-devel"
install_package "gettext-devel"
install_package "openssl-devel"
install_package "zlib-devel"
install_package "perl-ExtUtils-MakeMaker"

print_info "Compile git from source"
cd "/usr/local/src"
sudo wget "https://www.kernel.org/pub/software/scm/git/git-2.10.1.tar.gz"
sudo tar xzvf "git-2.10.1.tar.gz"

cd "git-2.10.1"
sudo make prefix=/usr/local all
sudo make prefix=/usr/local install

cd "$(dirname "${BASH_SOURCE[0]}")"
print_success "Git installed"

