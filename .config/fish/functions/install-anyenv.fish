# Install *env.fish commands to ~/.config/fish/functions
function install-anyenv
  # detect installed envs
  for SOMEENV in (ls "$HOME/.anyenv/envs")
    set OUTPUT_PATH "$HOME/.config/fish/functions/$SOMEENV.fish"
    test -e $OUTPUT_PATH; and continue

    set ENV_NAME (echo $SOMEENV | awk '{print toupper($1)}')  # rbenv to RBENV
    set ENV_ROOT (echo $ENV_NAME | awk '{printf "%s_ROOT", $1}')
    set ENV_SHELL (echo $ENV_NAME | awk '{printf "%s_SHELL", $1}')

    echo "Installing $SOMEENV to $OUTPUT_PATH."

    string trim "
set -x  $ENV_ROOT '$HOME/.anyenv/envs/$SOMEENV'
set -x  PATH \$PATH '$HOME/.anyenv/envs/$SOMEENV/bin'
set -gx PATH '$HOME/.anyenv/envs/$SOMEENV/shims' \$PATH
set -gx $ENV_SHELL fish

set COMPLETIONS '$HOME/.anyenv/libexec/../completions/$SOMEENV.fish'
test -e \$COMPLETIONS; and source \$COMPLETIONS

function $SOMEENV
  set command \$argv[1]
  set -e argv[1]

  switch \"\$command\"
    case rehash shell
      eval ($SOMEENV \"sh-\$command\" $argv|psub)
    case '*'
      command $SOMEENV \"\$command\" \$argv
  end
end
" >> $OUTPUT_PATH
  end
end
