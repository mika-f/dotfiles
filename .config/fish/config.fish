set -x TERM screen-256color
set -g theme_display_git_master_branch yes

# ---------------------
# *env configuration
if test -d {$HOME}/.anyenv/bin;
  init-anyenv
  install-anyenv
else
  # ---------------------
  # plenv configuration
  if command -v plenv;
    status --is-interactive; and source (plenv init -|psub)
    set -x PERL_VERSION (plenv version | awk '{print $1}')
    set -x PATH $HOME/.plenv/versions/$PERL_VERSION/bin $PATH # cpanm not link CLI tools to ~/.plenv/shims
  end

  # ---------------------
  # rbenv configuration
  if command -v rbenv;
    status --is-interactive; and source (rbenv init -|psub)
    set -x RUBY_VERSION (rbenv version | awk '{print $1}')
  end
end
# ---------------------
# n configuration
set -x N_PREFIX $HOME/n
set -x PATH $N_PREFIX/bin $PATH

# ---------------------
# ripgrep configuration
set -x RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# ---------------------
# aliases
alias vim='nvim'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

