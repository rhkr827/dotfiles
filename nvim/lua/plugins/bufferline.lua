return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Tab Next" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Tab Previous" },
      { "<Tab>q",  "<Cmd>BufferLinePickClose<CR>", desc = "Tab Close" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          diagnostics_indicator = function(_, _, diag)
            local icons = require("lazyvim.config").icons.diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end,
          color_icons = true,
        },
        highlights = {
          separator = {
            fg = "#073642",
            bg = "#002b36",
          },
          separator_selected = {
            fg = "#073642",
          },
          background = {
            fg = "#657b83",
            bg = "#002b36",
          },
          buffer_selected = {
            fg = "#fdf6e3",
            bold = true,
          },
          fill = {
            bg = "#073642",
          },
        },
      })
    end,
  },
}
