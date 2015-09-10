#!/bin/sh
# Installation Script


echo "============================================================="
echo " Environment Construction Script for RedHat                  "
echo "============================================================="

cd ~/dotfiles

echo "--------------------------------------"
echo " Install Environment                  "
echo "--------------------------------------"
./installation/ruby.sh
./installation/php.sh

# for rubyinterp of vim
. ./.bash_profile


echo "--------------------------------------"
echo " Install VIM                          "
echo "--------------------------------------"
./installation/vim.sh


echo "--------------------------------------"
echo " Post Installation Configuration      "
echo "--------------------------------------"
./installation/post_installation_ruby.sh
./installation/post_installation_php.sh

echo "--------------------------------------"
echo " Setting up . files                   "
echo "--------------------------------------"
./link.sh

