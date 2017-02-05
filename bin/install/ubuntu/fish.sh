#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_fish() {
  print_subheader "fish shell"

  install_repo "fish-shell/release-2"
  install_package "fish"

  # Oh! My Fish
  curl -s -L http://get.oh-my.fish | fish
  echo "omf install bobthefish" | fish

  print_success "fish shell installed"
}


