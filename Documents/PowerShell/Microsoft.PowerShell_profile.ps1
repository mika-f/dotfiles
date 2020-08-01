Import-Module 'E:\repos\github.com\Microsoft\vcpkg\scripts\posh-vcpkg'
Invoke-Expression (&starship init powershell)

# Aliases
Set-Alias ls lsd
Set-Alias which where.exe

# Replaced by Unix CoreUtils
function Replace-Alias($cmd) {
  Get-Alias $cmd *>1 && Remove-Alias $cmd
}

Replace-Alias cat
Replace-Alias cp
Replace-Alias echo
Replace-Alias mv
Replace-Alias pwd
Replace-Alias rm

# Call CoreUtils CLI instead of Windows System Commands
function Call-CoreUtils($cmd) {
  Set-Variable -name "CoreUtils_$cmd" -value "function $cmd() { $cmd.exe `$args }" -scope global
  Get-Variable "CoreUtils_$cmd" -ValueOnly | Invoke-Expression
} 

Call-CoreUtils mkdir
