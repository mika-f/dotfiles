# --------------------
# Initialize environment for *env
function init-anyenv
  if test -d $HOME/.anyenv;
    set -x PATH "$HOME/.anyenv/bin" $PATH
    source "$HOME/.anyenv/libexec/../completions/anyenv.fish"

    function anyenv
      set command $argv[1]
      set -e argv[1]

      command anyenv "$command" $argv
    end
  end
end
