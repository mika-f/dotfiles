#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_git() {
  print_subheader "Git"

  install_repo "git-core/ppa"
  update

  sudo apt-get upgrade -y -q
}

