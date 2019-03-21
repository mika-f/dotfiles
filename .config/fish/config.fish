set -x TERM screen-256color

# disable for large repos
set -g theme_display_git               yes
set -g theme_display_git_dirty         no
set -g theme_display_git_untracked     no
set -g theme_display_git_master_branch yes

# ---------------------
# anyenv configration
if test -d {$HOME}/.anyenv/bin;
  set -x PATH "$HOME/.anyenv/bin" $PATH
  status --is-interactive; and source (anyenv init -|psub)
end

# ---------------------
# PATH for local bins
test -d {$HOME}/.local/bin ; and set -x PATH "$HOME/.local/bin" $PATH
test -d {$HOME}/.cargo/bin ; and set -x PATH "$HOME/.cargo/bin" $PATH

# if set value to $GOPATH, use it
if test -n "$GOPATH";
  test -d {$GOPATH}/bin  ; and set -x PATH "$GOPATH/bin" $PATH
else
  test -d {$HOME}/go/bin ; and set -x PATH "$HOME/go/bin" $PATH
end

# ---------------------
# Android configuration
if test -d {$HOME}/Library/Android/sdk/platform-tools;
  set -x PATH $HOME/Library/Android/sdk/platform-tools $PATH
end

# ---------------------
# ripgrep configuration
test -e {$HOME}/.ripgreprc ; and set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# ---------------------
# ghq configuration
test -d {$HOME}/Desktop/repos ; and set -x GHQ_ROOT $HOME/Desktop/repos;
test -d {$HOME}/repos         ; and set -x GHQ_ROOT $HOME/repos;

# ---------------------
# aliases
command -v -q nvim ; and alias vim='nvim'
command -v -q lsd  ; and alias ls='lsd'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

