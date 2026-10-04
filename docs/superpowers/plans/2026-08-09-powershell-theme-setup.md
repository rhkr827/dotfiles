# PowerShell Theme Setup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Install and activate the repository's PowerShell theme configuration for the current user, without configuring Neovim or Visual Studio Code.

**Architecture:** The existing `powershell/user_profile.ps1` remains the source of theme behavior. The current PowerShell host profile will contain a small loader that dot-sources it by absolute path. Installation verifies each independent prerequisite before attempting installation and preserves an existing profile backup.

**Tech Stack:** PowerShell 7, Scoop, winget, PowerShellGet, Oh My Posh.

---

### Task 1: Inspect prerequisites and profile target

**Files:**
- Read: `powershell/user_profile.ps1`
- Read: `powershell/my.omp.json`
- Read/Modify: `$PROFILE.CurrentUserCurrentHost`

- [ ] **Step 1: Resolve the current-host profile and check theme dependencies**

Run:

```powershell
$PROFILE.CurrentUserCurrentHost
Get-Command scoop, winget, oh-my-posh -ErrorAction SilentlyContinue
Get-Module -ListAvailable posh-git, Terminal-Icons, PSFzf, PSReadLine, z
```

Expected: the profile path is reported; unavailable tools/modules are absent without terminating the session.

- [ ] **Step 2: Back up the profile if it exists and is not already the repository loader**

Run:

```powershell
$profilePath = $PROFILE.CurrentUserCurrentHost
$backupPath = "$profilePath.dotfiles-backup-$(Get-Date -Format yyyyMMddHHmmss)"
if (Test-Path -LiteralPath $profilePath) {
  Copy-Item -LiteralPath $profilePath -Destination $backupPath -ErrorAction Stop
}
```

Expected: an existing profile is copied once to a timestamped sibling path; no backup is created when no profile exists.

### Task 2: Install PowerShell-only prerequisites

**Files:**
- No repository files modified.

- [ ] **Step 1: Install Scoop if absent**

Run:

```powershell
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
  Invoke-RestMethod -Uri 'https://get.scoop.sh' | Invoke-Expression
}
```

Expected: `scoop --version` returns a version.

- [ ] **Step 2: Install command-line dependencies, excluding Neovim and VS Code**

Run:

```powershell
$packages = 'curl', 'sudo', 'jq', 'fzf', 'wget', 'unzip'
foreach ($package in $packages) {
  scoop install $package
}
```

Expected: Scoop reports each package installed or already installed; `neovim` and `code` are not passed to Scoop.

- [ ] **Step 3: Install Oh My Posh and required current-user modules**

Run:

```powershell
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
  winget install --id JanDeDobbeleer.OhMyPosh --exact --source winget --accept-package-agreements --accept-source-agreements
}
Install-Module posh-git -Scope CurrentUser -Force
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module PSFzf -Scope CurrentUser -Force
Install-Module PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module z -Scope CurrentUser -Force
```

Expected: Oh My Posh is available as a command and each module is discoverable with `Get-Module -ListAvailable`.

### Task 3: Link and validate the profile

**Files:**
- Modify: `$PROFILE.CurrentUserCurrentHost`
- Read: `powershell/user_profile.ps1`

- [ ] **Step 1: Create the profile directory and write the repository loader**

Run:

```powershell
$profilePath = $PROFILE.CurrentUserCurrentHost
$profileDirectory = Split-Path -Parent $profilePath
New-Item -ItemType Directory -Path $profileDirectory -Force | Out-Null
@'
. 'D:\Repository\dotfiles\powershell\user_profile.ps1'
'@ | Set-Content -LiteralPath $profilePath -Encoding utf8
```

Expected: the current-host profile contains the single dot-source loader.

- [ ] **Step 2: Start a clean PowerShell process and validate theme initialization**

Run:

```powershell
pwsh -NoLogo -NoProfile -Command ". '$PROFILE.CurrentUserCurrentHost'; oh-my-posh version; Get-Module posh-git, Terminal-Icons, PSFzf, PSReadLine | Select-Object Name, Version"
```

Expected: the command exits with code 0, reports an Oh My Posh version, and lists the four loaded modules without profile errors.

- [ ] **Step 3: Confirm scope exclusions**

Run:

```powershell
Get-Command nvim, code -ErrorAction SilentlyContinue
Get-Content -LiteralPath $PROFILE.CurrentUserCurrentHost
```

Expected: no installation or configuration commands for Neovim or Visual Studio Code were executed; the profile has only the PowerShell loader.
