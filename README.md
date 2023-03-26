# My dotfiles Settings

### Powershell

> Refererenced from devaslife dotfiles
> Configuration for better Powershell using oh-my-posh and packages

- Install NerdFont - Hack NF

- Install scoop

```powershell
iwr -useb get.scoop.sh | iex
```

- Install packages via scoop
```powershell
scoop install curl sudo jq neovim gcc fzf
```

- Install packages via Install-Module

> posh-git
```powershell
Install-Module posh-git -Scope CurrentUser -Force
```

> oh-my-push
```powershell
winget install JanDeDobbeleer.OhMyPosh -s wingetp
```

> Terminal-Icons
```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```

> PSFzf
```powershell
Install-Module -Name PSFzf -Scope CurrentUser -Force
```

> PSReadLine
```powershell
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

- Setting to excuting user_profile.ps1 when startup

```powershell
vim $PROFILE.CurrentUserCurrentHost
```

then copy below

```powershell
# . $env:USERPROFILE\.config\powershell\user_profile.ps1
$CONFIG_PATH = {your path} ex) "D:\Repository\dotfiles\"
$USR_PROFILE = "powershell\user_profile.ps1"
. $CONFIG_PATH$USR_PROFILE
```

### Neovim

> Modified Configuration based on devaslife dotfiles
> Configuration Neovim supporting develop including debugging below languages

![typescript](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/typescript.svg)
![markdown](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/markdown.svg)
![dotnet](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/.net.svg)
![cpp](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/cpp.svg)
![python](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/python.svg)

> Configured

| Lanuages | LSP | DAP    |
| -------- | --- | ------ |
| Python   | SET | TESTED |
| CMake    | SET | TBD    |
| C++      | SET | SET    |
| Dotnet   | SET | SET    |
| Rust     | SET | SET    |
| Dart     | SET | TBD    |

- Make Sync between paths
  > Same command 'ln' in Linux system

```powershell
 New-Item -ItemType SymbolicLink -Path $HOME\AppData\Local\nvim -Target $HOME\.config\nvim
```

- Install Packer
```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

- Plugins Configuration

| Plugins    | Configuration                                                      |
| ---------- | ------------------------------------------------------------------ |
| LSP        | Not fixed                                                          |
| Mason      | Install LSP, Lint, DAP and Formatter for supporting languages      |
| Telescope  | Set ignore file name pattern. Set keymap on WhichKey               |
| DAP        | Set keymap on dap config. Set to same as Visual Studio             |
| DAP UI     | Set keymap on WhichKey                                             |
| CMake      | Set keymap on WhichKey                                             |
| CMD Line   | Set Auto Completion and center floating. Using 'Widler' Plugin     |
| Dashboard  | Set keymap on WhichKey. Modify shortcut and hide Recent Projects   |
| NvimTree   | Set keymap on map config. Apply center floating and quit via <ESC> |
| ToggleTerm | Set keymap on map config. Using Powershell Preview 7(pwsh)         |
| treesitter | Add languages to ensure_installed                                  |
| WhichKey   | Cleanup keymaps on own config files and set to WhichKey            |
| Theme      | Using 'github-theme dimmed'                                        |
