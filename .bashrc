# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
. "$HOME/.aliases"
. "$HOME/.env"

if [ $TMUX ]; then
  fish
fi

