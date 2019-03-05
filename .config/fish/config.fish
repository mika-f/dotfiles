set -x TERM screen-256color
set -g theme_display_git_master_branch yes

# ---------------------
# anyenv configration
if test -d {$HOME}/.anyenv/bin;
  status --is-interactive; and source (anyenv init -|psub)
end

# ---------------------
# ripgrep configuration
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# ---------------------
# Android configuration
if test -d {$HOME}/Library/Android/sdk/platform-tools;
  set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH
end

# ---------------------
# aliases
command -v nvim ; and alias vim='nvim'

# ---------------------
# large repos
set -g theme_display_git           yes
set -g theme_display_git_dirty     no
set -g theme_display_git_untracked no

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

