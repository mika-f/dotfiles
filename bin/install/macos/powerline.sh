#!/bin/bash
set -Ceu

pip3 install git+git://github.com/powerline/powerline

echo "# Powerline" >> ~/.tmux.conf.local
echo "run-shell \"powerline-daemon -q\"" >> ~/.tmux.conf.local
echo "source \"$HOME/.anyenv/envs/pyenv/versions/$PYTHON_VERSION/lib/$PYTHON_COMMAND/site-packages/powerline/bindings/tmux/powerline.conf\"" >> ~/.tmux.conf.local
