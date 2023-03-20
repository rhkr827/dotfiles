local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end


local setup = {
  plugins = { spelling = false },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+",      -- symbol prepended to a group
  },
  window = {
    border = "rounded",                                                         -- none, single, double, shadow
    position = "bottom",                                                        -- bottom, top
  },
  ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Dashboard<cr>", "Dashboard" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>quitall<CR>", "Quit" },
  b = {
    name = "Buffer",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Open Buffers",
    },
    c = { "<cmd>bdelete!<CR>", "Close Buffer" },
  },
  c = {
    name = "CMake",
    g = { "<cmd>CMakeGenerate<cr>", "CMake Generate" },
    x = { "<cmd>CMakeGenerate!<cr>", "CMake Clean and Generate" },
    b = { "<cmd>CMakeBuild<cr>", "CMake Build" },
    r = { "<cmd>CMakeRun<cr>", "CMake Run" },
    d = { "<cmd>CMakeDebug<cr>", "CMake Debug" },
    i = { "<cmd>CMakeInstall<cr>", "CMake Install" },
    C = { "<cmd>CMakeClean<cr>", "CMake Clean" },
    s = { "<cmd>CMakeStop<cr>", "CMake Stop" },
  },
  d = {
    name = "DAP",
    t = { "<cmd>lua require('dapui').toggle{reset=true}<cr>", "Toggle DAPUI" },
    s = { "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)()<cr>", "View Current Scopes" },
    k = { "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.stacks)()<cr>", "View Current Stacks" },
    w = { "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.watches)()<cr>",
      "View Current Watches" },
    v = { "<cmd>lua require('dapui').eval()<cr>", "Evaluate" },
  },
  f = {
    name = "Find",
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))<cr>",
      "Find files" },
    --s = { "<cmd>lua require'config.telescope'.grep_prompt()<cr>", "Search" },
    e = { "<cmd>lua require'config.telescope'.file_explorer()<cr>", "File Browser" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    r = { "<cmd>lua require'config.telescope'.repo_list()<cr>", "Repo List" },
    c = { "<cmd>lua require'config.telescope'.find_configs()<cr>", "Find Config" },
    v = { "<cmd>lua require'config.telescope'.nvim_config()<cr>", "Nvim Config" },
    --l = { "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<cr>", "Live Grep" },
    o = { "<cmd>lua require'telescope.builtin'.oldfiles({prompt_title=':oldfiles', results_title='Old Files'})<cr>",
      "Old Files" },
    z = { "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>", "Current File Search" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    f = { "<cmd>lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'}",
      "Diff" }
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>lua require'telescope.builtin'.lsp_implementations()<cr>", "LSP Implementations" },
    d = { "<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>", "LSP Definitions" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    s = { "<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>", "Document Symbols" },
  },
  h = {
    name = "Help",
    r = { "<cmd>lua require'telescope.builtin'.registers()<cr>", "Resisters" },
    d = { "<cmd>lua require'telescope.builtin'.diagnostics()<cr>", "Diagnostics" },
    c = { "<cmd>lua require('telescope').extensions.command_palette.command_palette()<cr>", "Command Palette" },
    z = {
      "<cmd>lua require'telescope'.extensions.zoxide.list{results_title='Z Directories', prompt_title='Z Prompt'}<cr>",
      "Z Prompt" },
    h = {
      "<cmd>lua require('telescope').extensions.notify.notify({results_title='Notification History', prompt_title='Search Messages'})<cr>",
      "Notification History" },
  },
}


which_key.setup(setup)
which_key.register(mappings, opts)
