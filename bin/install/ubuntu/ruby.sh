#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_ruby() {
  print_warning "Ignorering Ruby install because setup script is not defined."
}

