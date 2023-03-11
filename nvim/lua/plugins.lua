local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- plugin Installer
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'
  -- gui
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim'     -- Common utilities
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use 'goolord/alpha-nvim'              -- Dashbord
  use 'akinsho/nvim-bufferline.lua'     -- TabPage Integration
  -- cmp (Completion)
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  -- lsp (Language Server Protocol)
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
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  -- git
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- for git blame & browse
  -- file manager
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  })
  use 'vim-airline/vim-airline'
  -- debugging
  use { 'rcarriga/nvim-dap-ui', requires = 'mfussenegger/nvim-dap' }
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
end)
