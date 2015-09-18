#!/bin/sh

# VIM Configuration for Ruby on Rails

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

install_unless_installed java-1.8.0-openjdk
install_unless_installed wget

cd ~
wget http://cx4a.org/pub/rsense/rsense-0.3.tar.bz2
bzip2 -dc rsense-0.3.tar.bz2 | tar xvf -
sudo cp -r rsense-0.3 /usr/local/lib
sudo chmod +x /usr/local/lib/rsense-0.3/bin/rsense

rm rsense-0.3.tar.bz2

echo "--------------------------------------"
echo "Install gem rubocop, refe2            "
gem install rubocop refe2
bitclust setup

install_unless_installed ctags

