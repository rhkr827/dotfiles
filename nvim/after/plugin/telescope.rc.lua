local status, telescope = pcall(require, "telescope")
if (not status) then return end

require('config.telescope')

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- this is default
    },
    file_browser = {
      hidden = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor(),
    },
    bookmarks = {
      selected_browser = "brave",
      url_open_command = "open",
    },
    command_palette = {
      {
        "File",
        { "Write Current Buffer", ":w" },
        { "Write All Buffers",    ":wa" },
        { "Quit",                 ":qa" },
        { "File Browser",         ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "Search for Word",      ":lua require('telescope.builtin').live_grep()",                  1 },
        { "Project Files",        ":lua require'config.telescope'.project_files()",                 1 },
      },
      {
        "Git(Hub)",
        { " Issues",              "lua require'joel.telescope'.gh_issues()",      1 },
        { " Pulls",               "lua require'joel.telescope'.gh_prs()",         1 },
        { " Status",              "lua require'telescope.builtin'.git_status()",  1 },
        { " Diff Split Vertical", ":Gvdiffsplit!",                                1 },
        { " Log",                 "lua require'telescope.builtin'.git_commits()", 1 },
        {
          " File History",
          ":lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})",
          1,
        },
      },
      {
        "Terminal",
        { "Vertical Right", ":vsp | terminal", 1 },
      },
      {
        "Toggle",
        { "cursor line",         ":set cursorline!" },
        { "cursor column",       ":set cursorcolumn!" },
        { "spell checker",       ":set spell!" },
        { "relative number",     ":set relativenumber!" },
        { "search highlighting", ":set hlsearch!" },
        { "Colorizer",           ":ColorToggle" },
        { "Fold Column",         ":lua require'joel.settings'.toggle_fold_col()" },
      },
      {
        "Neovim",
        { "checkhealth",     ":checkhealth" },
        { "commands",        ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers",       ":lua require('telescope.builtin').registers()" },
        { "options",         ":lua require('telescope.builtin').vim_options()" },
        { "keymaps",         ":lua require('telescope.builtin').keymaps()" },
        { "buffers",         ":Telescope buffers" },
        { "search history",  ":lua require('telescope.builtin').search_history()" },
      },
    },
  },
  defaults = {
    preview = {
      timeout = 500,
      msg_bg_fillchar = "",
    },
    multi_icon = " ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_config = {
      prompt_position = "bottom",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    dynamic_preview_title = true,
    winblend = 4,
  },

}

-- extensions
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("repo")
telescope.load_extension("zoxide")
telescope.load_extension("command_palette")
