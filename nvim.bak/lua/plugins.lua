local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


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
  use 'gelguy/wilder.nvim'        -- cmdline autocomplete
  use 'akinsho/bufferline.nvim'

  -- Theme
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use 'tribela/vim-transparent'

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
  use 'dinhhuy258/git.nvim'

  -- Degugging
  use { 'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui', }
  }

  -- Markdown
  use 'SidOfc/mkdx'
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  -- c++
  use 'Civitasv/cmake-tools.nvim'
  use 'alepez/vim-gtest'
  use 'rhysd/vim-clang-format'

  -- rust
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  -- support development
  use 'tpope/vim-commentary'
  use 'L3MON4D3/LuaSnip'        -- snippet for lua
  use 'windwp/nvim-ts-autotag'
  use 'preservim/tagbar'        -- overview of currentf file's structure
  use 'akinsho/toggleterm.nvim' -- toggle terminal
  use 'wakatime/vim-wakatime'
  use 'jxnblk/vim-mdx-js'       -- support mdx

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
