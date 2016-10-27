#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_powerline() {
  print_subheader "Powerline"

  curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
  sudo python /tmp/get-pip.py

  pip install --user git+git://github.com/powerline/powerline
  sudo pip install psutil

  export PATH="$HOME/.local/bin:$PATH"

  print_success "Powerline installed"
}

