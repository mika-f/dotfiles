#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

update

print_header "Softwares"
install_package "gcc"
install_package "mak"
install_package "gcc-c++"
install_package "rsync"
./git.sh
./vim.sh

print_header "UI"
install_package "tmux"
./fish.sh
./powerline.sh

