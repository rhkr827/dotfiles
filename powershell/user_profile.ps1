# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Oh My Posh Theme
$omp_config = Join-Path $PSScriptRoot "my.omp.json"
if ((Get-Command oh-my-posh -ErrorAction SilentlyContinue) -and (Test-Path $omp_config)) {
    oh-my-posh init pwsh --config $omp_config | Invoke-Expression
}

# Modules (Loaded safely if installed)
Import-Module posh-git -ErrorAction SilentlyContinue
Import-Module Terminal-Icons -ErrorAction SilentlyContinue
Import-Module PSFzf -ErrorAction SilentlyContinue

# Alias
Set-Alias sysenv SystemPropertiesAdvanced -ErrorAction SilentlyContinue

# PSReadLine Configuration
if (Get-Module -ListAvailable PSReadLine) {
    Set-PSReadLineOption -EditMode Emacs -ErrorAction SilentlyContinue
    Set-PSReadLineOption -BellStyle None -ErrorAction SilentlyContinue
    Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar -ErrorAction SilentlyContinue
    
    # Only enable prediction in interactive console
    if (-not [Console]::IsOutputRedirected) {
        try {
            Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
            Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction SilentlyContinue
        } catch {}
    }
}

# Fzf Keybindings (Ctrl+F for file, Ctrl+R for history)
if (Get-Command Set-PsFzfOption -ErrorAction SilentlyContinue) {
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r' -ErrorAction SilentlyContinue
}

# Env
if (Test-Path "C:\Windows\system32\OpenSSH\ssh.exe") {
    $env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
}

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
