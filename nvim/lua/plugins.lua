local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

packer.startup(function(use)
  -- Plugin Installer
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'

  -- UI
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim'     -- Common utilities
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms
  use 'vim-airline/vim-airline'
  use 'glepnir/dashboard-nvim'    -- Dashbord
  use 'folke/which-key.nvim'
  use 'rcarriga/nvim-notify'      -- GUI style notification
  use 'ahmedkhalf/project.nvim'
  use 'nicknisi/dotfiles'
  use 'EdenEast/nightfox.nvim' -- theme
  use 'gelguy/wilder.nvim'     -- cmdline autocomplete

  -- CMP (Completion)
  use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'     -- Completion

  -- LSP (Language Server Protocol)
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    },
    tag = 'nightly'
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  -- Telescope Extensions
  use "cljoly/telescope-repo.nvim"
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use "dhruvmanila/telescope-bookmarks.nvim"
  use "nvim-telescope/telescope-github.nvim"
  use { "LinArcX/telescope-command-palette.nvim" }
  use {
    "AckslD/nvim-neoclip.lua",
    config = function() require("neoclip").setup() end,
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "jvgrootveld/telescope-zoxide"

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- DAP
  use({
    "mfussenegger/nvim-dap",
    requires = {
      { "rcarriga/nvim-dap-ui" },
    },
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- c++ development
  use 'cdelledonne/vim-cmake'
  use 'alepez/vim-gtest'
  use 'antoinemadec/FixCursorHold.nvim'

  -- support development
  use 'tpope/vim-commentary'
  use 'L3MON4D3/LuaSnip'        -- snippet for lua
  use 'windwp/nvim-ts-autotag'
  use 'preservim/tagbar'        -- overview of currentf file's structure
  use "akinsho/toggleterm.nvim" -- toggle terminal
  use 'wakatime/vim-wakatime'

  use 'SirVer/ultisnips' -- snippet insertion
end)
