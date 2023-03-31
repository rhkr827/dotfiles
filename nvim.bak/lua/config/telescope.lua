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

M.project_files = function()
  local _, ret, stderr = utils.get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  local gopts = {}
  local fopts = {}

  gopts.prompt_title = " Find"
  gopts.prompt_prefix = "  "
  gopts.results_title = " Repo Files"

  fopts.hidden = true
  fopts.file_ignore_patterns = {
    ".local/",
    ".cache/",
    ".cargo/",
    "Downloads/",
    ".git/",
    "Library/",
    ".rustup/",
    "node_modules/",
    "env/",
    "build/",
    "bin/",
    "obj/",
    "Debug/"
  }

  if ret == 0 then
    require("telescope.builtin").git_files(gopts)
  else
    fopts.results_title = "CWD: " .. vim.fn.getcwd()
    require("telescope.builtin").find_files(fopts)
  end
end

function M.find_configs()
  require("telescope.builtin").find_files {
    prompt_title = " NVim & Term Config Find",
    results_title = "Config Files Results",
    path_display = { "smart" },
    search_dirs = {
      "~/.config/nvim",
      "~/.config/powershell",
    },
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50, width = 0.80 },
  }
end

function M.nvim_config()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50, width = 0.80 },
  }
end

function M.file_explorer()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " File Browser",
    path_display = { "smart" },
    cwd = "./",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.50, width = 0.80 },
  }
end

return M
