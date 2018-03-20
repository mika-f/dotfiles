#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

. "./fish.sh"
. "./git.sh"
. "./node.sh"
. "./powerline.sh"
. "./ruby.sh"
. "./tmux.sh"
. "./vim.sh"

update

print_header "Softwares"
print_subheader "GNU Utilities"
install_package "build-essential"
install_package "rsync"
install_package "wget"
install_package "curl"
install_git
install_vim

# Optional
install_ruby
install_node

print_header "UI"
install_tmux
install_fish
install_powerline

print_header "Link"
link ".aliases"
link ".bashrc"
link ".config"
link ".gemrc"
link ".gitconfig"
link ".tmux.conf"
link ".vimrc"

