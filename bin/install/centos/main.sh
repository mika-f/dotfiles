#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

update

print_header "Softwares"
install_package "gcc"
install_package "make"
install_package "gcc-c++"
install_package "rsync"
./git.sh
./vim.sh

# Optional
./ruby.sh

print_header "UI"
print_header "tmux"
install_package "tmux"
./fish.sh
./powerline.sh

