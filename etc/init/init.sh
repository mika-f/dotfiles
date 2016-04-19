#!/bin/bash

. "$DOTPATH"/etc/install -l
. "$DOTPATH"/etc/lib/ask

print_header "Install some packages"

. "$DOTPATH"/etc/init/git

# if ask "Do you want to install Ruby with rbenv?"; then
  . "$DOTPATH"/etc/init/ruby
# fi

# if ask "Do you want to install vim(Custom Build)?"; then
  . "$DOTPATH"/etc/init/vim
# fi

print_done "Packages installed"
