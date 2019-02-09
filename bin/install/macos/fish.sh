#!/bin/bash
set -Ceu

# Install fish and configuration, theme

brew install fish
curl -L https://get.oh-my.fish | fish
echo "omf install bobthefish" | fish
