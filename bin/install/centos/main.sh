#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

. "./fish.sh"
. "./git.sh"
. "./node.sh"
. "./powerline.sh"
. "./ruby.sh"
. "./vim.sh"

update

print_header "Softwares"
print_subheader "GNU Utilities"
install_package "gcc"
install_package "make"
install_package "gcc-c++"
install_package "rsync"
install_package "wget"
install_git
install_vim

# Optional
install_ruby
install_node

print_header "UI"
print_subheader "tmux"
install_package "tmux"
install_fish
install_powerline

