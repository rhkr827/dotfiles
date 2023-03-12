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
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim'     -- Common utilities
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use 'akinsho/nvim-bufferline.lua' -- TabPage Integration
  use 'vim-airline/vim-airline'
  use 'glepnir/dashboard-nvim'      -- Dashbord

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

  -- nvim-telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- for git blame & browse

  -- debugging
  use { 'jay-babu/mason-nvim-dap.nvim', requires = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui' } }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- c++ development
  use 'cdelledonne/vim-cmake'
  use 'alepez/vim-gtest'
  use 'antoinemadec/FixCursorHold.nvim'

  -- support development
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
  use 'L3MON4D3/LuaSnip'        -- snippet for lua
  use 'windwp/nvim-ts-autotag'
  use 'preservim/tagbar'        -- overview of currentf file's structure
  use "akinsho/toggleterm.nvim" -- toggle terminal
  use 'folke/which-key.nvim'
  use 'ahmedkhalf/project.nvim'
  use 'wakatime/vim-wakatime'
  use 'rhysd/vim-clang-format'

  if packer_bootstrap then
    packer.sync()
  end
end)
