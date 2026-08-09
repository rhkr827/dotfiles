# PowerShell Theme Setup Design

## Scope

Apply the repository's PowerShell-only configuration. Do not install, configure, or link Neovim or Visual Studio Code.

## Approach

Install the theme dependencies for the current Windows user, then configure the current PowerShell host profile to dot-source `D:\Repository\dotfiles\powershell\user_profile.ps1`.

## Components

- Install Scoop if it is unavailable, then install the PowerShell-related command-line dependencies required by the README: `curl`, `sudo`, `jq`, `fzf`, `wget`, and `unzip`.
- Install Oh My Posh with winget.
- Install the PowerShell modules `posh-git`, `Terminal-Icons`, `PSFzf`, `PSReadLine` (prerelease), and `z` in the current-user scope.
- Ensure a Nerd Font is available for the glyphs used by the included Oh My Posh theme. The intended font is Hack Nerd Font.
- Back up an existing current-host PowerShell profile before replacing its repository loader entry. The resulting profile will load only the repository's `powershell\user_profile.ps1` for this setup and will not configure Neovim or VS Code.

## Behavior

On each PowerShell startup, the loaded profile initializes UTF-8 I/O, posh-git, the `my.omp.json` Oh My Posh theme, Terminal-Icons, PSReadLine history prediction, PSFzf key bindings, the SSH executable environment variable, and the existing `vim`/`sysenv` aliases.

## Error Handling

Each dependency installation will first check whether the command or module is already present. If an install fails, the remaining independent components will still be attempted and failures will be reported. The profile loader will be written only after the target profile path and backup location have been confirmed.

## Verification

Open a fresh non-interactive PowerShell session, confirm that Oh My Posh initializes without profile errors, and verify that `Get-Module` can resolve the installed modules. Neovim and VS Code commands/configuration will not be touched.
