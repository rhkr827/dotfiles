# Set PowerShell to UTF-8
# Setting
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Set Module
Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\my.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# Alias
Set-Alias vim nvim

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSREADLineOption -PredictionViewStyle ListView

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
