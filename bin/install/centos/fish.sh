#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
. "../../../lib/helpers.sh"
. "./helpers.sh"

install_repo "http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo"
install_package "fish"

# Oh! My Fish
curl -L http://get.oh-my.fish | fish
echo "omf install bobthefish" | fish
