# ==============================================================================
# PowerShell Oh-My-Posh Theme 1-Click Setup Script
# ==============================================================================

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  PowerShell Oh-My-Posh Theme Setup" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Check & Install Oh My Posh
Write-Host "`n[1/4] Checking Oh My Posh..." -ForegroundColor Yellow
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Oh My Posh via winget..." -ForegroundColor Gray
    try {
        winget install --id JanDeDobbeleer.OhMyPosh --exact --source winget --accept-package-agreements --accept-source-agreements
        # Refresh Path
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } catch {
        Write-Warning "winget installation failed. Trying scoop..."
        if (Get-Command scoop -ErrorAction SilentlyContinue) {
            scoop install oh-my-posh
        } else {
            Write-Error "Please install winget or scoop first."
        }
    }
} else {
    Write-Host "✓ Oh My Posh is already installed." -ForegroundColor Green
}

# 2. Install Required PowerShell Modules
Write-Host "`n[2/4] Installing Required PowerShell Modules..." -ForegroundColor Yellow
$modules = @('posh-git', 'Terminal-Icons', 'PSFzf', 'PSReadLine')
foreach ($mod in $modules) {
    if (-not (Get-Module -ListAvailable $mod)) {
        Write-Host "Installing module: $mod..." -ForegroundColor Gray
        Install-Module -Name $mod -Scope CurrentUser -Force -AllowClobber -SkipPublisherCheck -ErrorAction SilentlyContinue
    } else {
        Write-Host "✓ Module $mod is already installed." -ForegroundColor Green
    }
}

# 3. Configure PowerShell Profile
Write-Host "`n[3/4] Configuring PowerShell Profile..." -ForegroundColor Yellow
$profilePath = $PROFILE.CurrentUserCurrentHost
$profileDir = Split-Path $profilePath -Parent

if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceProfile = Join-Path $scriptDir "powershell\user_profile.ps1"

# Backup existing profile if exists
if (Test-Path $profilePath) {
    $backupPath = "$profilePath.bak.$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    Copy-Item $profilePath $backupPath -Force
    Write-Host "✓ Backed up existing profile to: $backupPath" -ForegroundColor Gray
}

# Add loader to $PROFILE
$loaderComment = "# Dotfiles Theme Loader"
$loaderCommand = ". `"$sourceProfile`""

$profileContent = ""
if (Test-Path $profilePath) {
    $profileContent = Get-Content $profilePath -Raw
}

if ($profileContent -notmatch [regex]::Escape($sourceProfile)) {
    Add-Content -Path $profilePath -Value "`n$loaderComment`n$loaderCommand`n" -Encoding UTF8
    Write-Host "✓ Added dotfiles loader to $profilePath" -ForegroundColor Green
} else {
    Write-Host "✓ Profile already contains dotfiles loader." -ForegroundColor Green
}

# 4. Nerd Font Notice
Write-Host "`n[4/4] Font Check" -ForegroundColor Yellow
Write-Host "Oh-My-Posh glyphs require a Nerd Font (e.g. Hack Nerd Font, Meslo LGM NF)." -ForegroundColor Gray
Write-Host "Tip: Run 'oh-my-posh font install' to install your preferred Nerd Font easily." -ForegroundColor Cyan

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "  Setup Completed Successfully!" -ForegroundColor Green
Write-Host "  Please restart PowerShell to enjoy your new theme!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
