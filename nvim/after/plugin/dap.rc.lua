local status_dap, dap = pcall(require, "dap")
if (not status_dap) then
  print('DAP is something wrong.')
  return
end

local status_ui, dapui = pcall(require, "dapui")
if (not status_ui) then
  print('DAP is something wrong.')
  return
end


-- Signature
vim.fn.sign_define('DapBreakpoint', { text = "", texthl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", numhl = "" })
vim.fn.sign_define('DapStopped', { text = "", texthl = "", numhl = "" })

dapui.setup({
  force_buffers = false,
  element_mappings = {
    scopes = {
      edit = "l",
    },
  },
  layouts = {
    -- {
    --   elements = {
    --     -- "watches",
    --     -- "scopes",
    --     -- "stacks",
    --     -- "breakpoints",
    --   },
    --   size = 80,
    --   position = "left",
    -- },
    {
      -- elements = { "repl", "console" },
      elements = { "console" },
      size = 0.30,
      position = "bottom",
    },
  },
  render = {
    max_value_lines = 3,
  },
  floating = { max_width = 0.9, max_height = 0.5, border = vim.g.border_chars },
})


local mappings = {
  ["<F5>"] = dap.continue,
  ["<F10>"] = dap.step_over,
  ["<F11>"] = dap.step_into,
  ["<S-F11>"] = dap.step_out,
  ["<F9>"] = dap.toggle_breakpoint,
  ["<S-F5>"] = dap.terminate,
}

for keys, mapping in pairs(mappings) do
  vim.api.nvim_set_keymap("n", keys, "", { callback = mapping, noremap = true })
end

-- DAP Apapters
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' }
}

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
}

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath('data') .. "/mason/bin/dart-debug-adapter",
    "flutter" }
}

dap.adapters.lldb = {
  type = "executable",
  attach = { pidProperty = "pid", pidSelect = "ask" },
  command = "lldb-vscode",
  env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
}

dap.adapters.rust = dap.adapters.lldb

-- DAP Configurations
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    console = "integratedTerminal",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/env/Scripts/python") == 1 then
        return cwd .. "/env/Scripts/python"
      elseif vim.fn.executable(cwd .. "/env/Scripts/python") == 1 then
        return cwd .. "/env/Scripts/python"
      else
        return "python"
      end
    end,
  },
}

dap.adapters.cppdbg = {
  name = "Launch",
  type = "cpptools",
  request = "launch",
  program = '${workspaceFolder}/main',
  cwd = '${workspaceFolder}',
  stopOnEntry = true,
  args = {},
  runInTerminal = false,
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

-- dap.configurations.dart = {
--   {
--     type = "dart",
--     request = "launch",
--     name = "Launch flutter",
--     dartSdkPath = os.getenv('HOME') .. "/flutter/bin/cache/dart-sdk/",
--     flutterSdkPath = os.getenv('HOME') .. "/flutter",
--     program = "${workspaceFolder}/lib/main.dart",
--     cwd = "${workspaceFolder}",
--   }
-- }

dap.configurations.rust = {
  {
    type = "rust",
    request = "launch",
    name = "lldb",
    program = function()
      local metadata_json = vim.fn.system("cargo metadata --format-version 1 --no-deps")
      local metadata = vim.fn.json_decode(metadata_json)
      local target_name = metadata.packages[1].targets[1].name
      local target_dir = metadata.target_directory
      return target_dir .. "/debug/" .. target_name
    end,
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
