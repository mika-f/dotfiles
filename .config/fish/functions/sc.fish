# Please execute this function in VSCode Terminal
# example:
#   > sc EXPRESSION
function sc
  set -l file (sk -m -q $argv)
  string length -q $file; and code $file
end
