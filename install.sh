#!/bin/sh

# Reference: http://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

cd ~/dotfiles

for file in .??*
do
  [[ "$file" == ".git" ]] && continue

  ln -snvf "$HOME/dotfiles/$file" "$HOME/$file"
done

