Import-Module PSReadLine
# Import-Module 'E:\repos\github.com\Microsoft\vcpkg\scripts\posh-vcpkg'
Invoke-Expression (&starship init powershell)

# Replaced by Unix CoreUtils
function Remove-Alias-When-Exists($cmd) {
  Get-Alias $cmd > $null 2>&1 && Remove-Alias $cmd -Force
}

Remove-Alias-When-Exists cat
Remove-Alias-When-Exists cp
Remove-Alias-When-Exists echo
Remove-Alias-When-Exists mv
Remove-Alias-When-Exists pwd
Remove-Alias-When-Exists rm
Remove-Alias-When-Exists tee
Remove-Alias-When-Exists diff

# Aliases
Set-Alias ls lsd
Set-Alias git hub
Set-Alias which where.exe
Set-Alias open Invoke-Item
Set-Alias cat bat


# Call CoreUtils CLI instead of Windows System Commands
function Invoke-CoreUtils($cmd) {
  Set-Variable -name "CoreUtils_$cmd" -value "function $cmd() { $cmd.exe `$args }" -scope global
  Get-Variable "CoreUtils_$cmd" -ValueOnly | Invoke-Expression
}

Invoke-CoreUtils mkdir

# Command Wrapper
function Search-History($query) {
  Get-Content (Get-PSReadLineOption).HistorySavePath | rg $query
}

# Invoke-Expression (&ast init pwsh | Out-String)


$env:OPENSSL_CONF = ""
$env:DOCKER_HOST = "tcp://localhost:2375"
