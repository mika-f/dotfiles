#!/bin/sh
# Installation Script

echo "============================================================="
echo " Environment Construction Script for RedHat                  "
echo "============================================================="

cd ~/dotfiles

echo "--------------------------------------"
echo " Install Ruby Environment             "
echo "--------------------------------------"
./installation/ruby.sh

# for rubyinterp of vim
. ./.bash_profile


echo "--------------------------------------"
echo " Install VIM                          "
echo "--------------------------------------"
./installation/vim.sh


echo "--------------------------------------"
echo " Post Installation Configuration      "
echo "--------------------------------------"
./installation/post_installation.sh


echo "--------------------------------------"
echo " Setting up . files                   "
echo "--------------------------------------"
./link.sh

