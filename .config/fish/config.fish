set -x TERM screen-256color
set -g theme_display_git_master_branch yes

# ---------------------
# *env configuration
if test -d {$HOME}/.anyenv/bin;
  set -x PATH "$HOME/.anyenv/bin" $PATH
  anyenv init - fish | source
end

# ---------------------
# PATH for local bins
test -d {$HOME}/.local/bin ; and set -x PATH "$HOME/.local/bin" $PATH

# ---------------------
# ripgrep configuration
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# ---------------------
# aliases
command -v nvim ; and alias vim='nvim'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

