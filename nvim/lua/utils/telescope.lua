local utils = require "telescope.utils"

local M = {}

function M.repo_list()
  local opts = {}
  opts.prompt_title = " Repos"
  require("telescope").extensions.repo.list(opts)
end

local function grep_filtered(opts)
  opts = opts or {}
  require("telescope.builtin").grep_string {
    path_display = { "smart" },
    search = opts.filter_word or "",
  }
end

function M.grep_prompt()
  vim.ui.input({ prompt = "Rg " }, function(input)
    grep_filtered { filter_word = input }
  end)
end

function M.nvim_config()
  require("lazyvim.util").telescope() {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50, width = 0.80 },
  }
end

function M.file_explorer()
  require("lazyvim.util").telescope() {
    prompt_title = " File Browser",
    path_display = { "smart" },
    cwd = "./",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50, width = 0.80 },
  }
end

return M
