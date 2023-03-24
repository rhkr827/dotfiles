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
    elements = { "console", "repl" },
    size = 0.30,
    position = "bottom",
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

-- Log Level
dap.set_log_level('TRACE')

-- DAP Apapters
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' }
}

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe',
  args = { '--interpreter=vscode' }
}

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath('data') .. "/mason/bin/dart-debug-adapter.cmd",
    "flutter" }
}

dap.adapters.codelldb = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb.exe',
}

dap.adapters.cpp = dap.adapters.codelldb
dap.adapters.rust = dap.adapters.codelldb

-- DAP Configurations

dap.defaults.fallback.terminal_win_cmd = "10split new"

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

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    console = "integratedTerminal",
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

local file = require("config.file")
dap.configurations.cpp = {
  {
    name = "C++ Debug And Run",
    type = "codelldb",
    request = "launch",
    program = function()
      -- First, check if exists CMakeLists.txt
      local cwd = vim.fn.getcwd()
      if file.exists(cwd, "CMakeLists.txt") then
        -- Then invoke cmake commands
        -- Then ask user to provide execute file
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      else
        local fileName = vim.fn.expand("%:t:r")
        -- create this directory
        os.execute("mkdir -p " .. "bin")
        local cmd = "!g++ -g % -o bin/" .. fileName
        -- First, compile it
        vim.cmd(cmd)
        -- Then, return it
        return "${fileDirname}/bin/" .. fileName
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
}

dap.configurations.rust = {
  {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    console = "integratedTerminal",
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
