# My dotfiles Settings

### Powershell

Refererenced from devaslife  
Configuration for better Powershell using oh-my-posh and packages

- Install NerdFont - Hack NF

- Setting 
```powershell
vim $PROFILE.CurrentUserCurrentHost
```
- Install scoop and packages via scoop

```powershell
iwr -useb get.scoop.sh | iex
scoop install curl sudo jq neovim gcc
```

- Install packages via Install-Module

```powershell
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name PSFzf -Scope CurrentUser -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

### Neovim

Referenced from devaslife  
Configuration Neovim supporting develop including debugging below languages

![typescript](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/typescript.svg)
![markdown](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/markdown.svg)
![dotnet](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/.net.svg)
![cpp](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/cpp.svg)
![python](https://raw.githubusercontent.com/rhkr827/MyBadgeMaker/e69f02a2494f4d2cf1bad1173d5cdde7cde2e86c/badge/python.svg)

Json, cmake and Rust also support

- Plugins List
```powershell
 New-Item -ItemType SymbolicLink -Path "C:\Users\user\AppData\Local\nvim" -Target "D:\Repository\dotfile\nvim"
```