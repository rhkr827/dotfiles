return {
  { "LazyVim/LazyVim",  
    opts = {
      colorscheme = "github_dimmed"
    }
  },
    
  --Additional plugins
 -- Vim css color
  {"ap/vim-css-color"}, 
    -- This is needed to fix lsp doc highlight
   {"antoinemadec/FixCursorHold.nvim"},
   -- Bdelete command
   {"moll/vim-bbye"},
   -- Git
   {"tpope/vim-fugitive"},
   -- Wakatime
   {"wakatime/vim-wakatime"},
   -- TagBar
   {"preservim/tagbar"},
}
