#!/bin/sh

# PHP Environment Install Script

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

install_unless_installed php
install_unless_installed php-fpm

# Auto launch
sudo chkcongig php-fpm on
