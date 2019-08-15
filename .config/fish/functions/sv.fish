function sv
  set -l file (sk -m -q $argv)
  string length -q $file; and vim $file
end
