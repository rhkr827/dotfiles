local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

vim.api.nvim_create_augroup("SyncPackerPlugins", {})
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerSync", pattern = "plugins.lua", group = "SyncPackerPlugins" }
)

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
  use 'gelguy/wilder.nvim'     -- cmdline autocomplete
  use 'EdenEast/nightfox.nvim' --theme

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

  -- fzf
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'cljoly/telescope-repo.nvim',
      'LinArcX/telescope-command-palette.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'jvgrootveld/telescope-zoxide',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }
    },
  }

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- DAP
  use { 'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui', }
  }

  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  -- c++ development
  use 'Civitasv/cmake-tools.nvim'
  use 'alepez/vim-gtest'
  use 'rhysd/vim-clang-format'

  -- support development
  use 'tpope/vim-commentary'
  use 'L3MON4D3/LuaSnip'        -- snippet for lua
  use 'windwp/nvim-ts-autotag'
  use 'preservim/tagbar'        -- overview of currentf file's structure
  use 'akinsho/toggleterm.nvim' -- toggle terminal
  use 'wakatime/vim-wakatime'
  use 'SirVer/ultisnips'        -- snippet insertion

  if PACKER_BOOTSTRAP then
    print('Changed plugins. Execute PackerSync')
    require("packer").sync()
  else
    print('None of changed plugins.')
  end
end)
