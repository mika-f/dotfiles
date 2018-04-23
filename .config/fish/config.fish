set -x TERM screen-256color
set -g theme_display_git_master_branch yes
# plenv configuration
status --is-interactive; and source (plenv init -|psub)

# n configuration
set -x N_PREFIX $HOME/n
set -x PATH $N_PREFIX/bin $PATH

