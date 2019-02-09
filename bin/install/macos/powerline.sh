#!/bin/bash

PYTHON_VERSION=3.7.2
PYTHON_COMMAND=python3.7

anyenv install pyenv
exec $SHELL -l

xcode-select --install
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

export CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl)"
pyenv install -v $PYTHON_VERSION

pyenv rehash
pyenv global $PYTHON_VERSION

pip3 install git+git://github.com/powerline/powerline

echo "# Powerline" >> ~/.tmux.conf.local
echo "run-shell \"powerline-daemon -q\"" >> ~/.tmux.conf.local
echo "source \"$HOME/.anyenv/envs/pyenv/versions/$PYTHON_VERSION/lib/$PYTHON_COMMAND/site-packages/powerline/bindings/tmux/powerline.conf\"" >> ~/.tmux.conf.local

