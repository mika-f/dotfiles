#!/bin/sh

# Ruby Environment Install Script

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

install_unless_installed gcc
install_unless_installed make
install_unless_installed openssl-devel
install_unless_installed zlib-devel
install_unless_installed readline*
install_unless_installed readline-devel
install_unless_installed gcc-c++

echo "--------------------------------------"
echo "Install rbenv                         "

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
. ~/.bash_profile

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -v 2.1.2

rbenv rehash
rbenv global 2.1.2

echo "--------------------------------------"
echo "Install gems : rails, bundler         "
gem install rails
gem install bundler

