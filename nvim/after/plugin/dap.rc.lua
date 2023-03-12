local status, mason_dap = pcall(require, "mason-nvim-dap")
if (not status) then return end

local opts = { ensured_installed = { "python", "cppdbg" } }

mason_dap.setup(opts)
mason_dap.setup_handlers {
  python = function()
    local dap = require("dap")
    dap.adapters.python = {
      type = 'executable',
      command = 'python',
      args = { '-m', 'debugpy.adapter' }
    }

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
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

    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}

vim.keymap.set('n', ';b', '<cmd>DapToggleBreakpoint<cr>', { silent = true })
vim.keymap.set('n', ';c', '<cmd>DapContinue<cr>', { silent = true })
vim.keymap.set('n', ';s', '<cmd>DapTerminate<cr>', { silent = true })
vim.keymap.set('n', ';i', '<cmd>DapStepInto<cr>', { silent = true })
vim.keymap.set('n', ';o', '<cmd>DapStepOut<cr>', { silent = true })
vim.keymap.set('n', ';v', '<cmd>DapStepOver<cr>', { silent = true })

vim.fn.sign_define('DapBreakpoint', { text = "🔴", texthl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟩", texthl = "", numhl = "" })
vim.fn.sign_define('DapStopped', { text = "🟡", texthl = "", numhl = "" })

-- lvim.keys.normal_mode["<leader>dh"] = "lua require'dap'.toggle_breakpoint()<CR>"
-- lvim.keys.normal_mode["S-k>"] = "lua require'dap'.step_out()<CR>"
-- lvim.keys.normal_mode["S-l>"] = "lua require'dap'.step_into()<CR>"
-- lvim.keys.normal_mode["S-j>"] = "lua require'dap'.step_over()<CR>"
-- lvim.keys.normal_mode["<leader>ds"] = "lua require'dap'.stop()<CR>"
-- lvim.keys.normal_mode["<leader>dn"] = "lua require'dap'.continue()<CR>"
-- lvim.keys.normal_mode["<leader>dk"] = "lua require'dap'.up()<CR>"
-- lvim.keys.normal_mode["<leader>dj"] = "lua require'dap'.down()<CR>"
-- lvim.keys.normal_mode["<leader>d_"] = "lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>"
-- lvim.keys.normal_mode["<leader>dr"] = "lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l"
-- lvim.keys.normal_mode["<leader>di"] = "lua require'dap.ui.variables'.hover()<CR>"
-- lvim.keys.visual_mode["<leader>di"] = "lua require'dap.ui.variables'.visual_hover()<CR>"
-- lvim.keys.normal_mode["<leader>d?"] = "lua require'dap.ui.variables'.scopes()<CR>"
-- -- lvim.keys.normal_mode["leader>de"] = "lua require'dap'.set_exception_breakpoints({"all "})<CR>"
-- lvim.keys.normal_mode["<leader>da"] = "lua require'debugHelper'.attach()<CR>"
-- lvim.keys.normal_mode["<leader>dA"] = "lua require'debugHelper'.attachToRemote()<CR>"
-- lvim.keys.normal_mode["<leader>di"] = "lua require'dap.ui.widgets'.hover()<CR>"
-- lvim.keys.normal_mode["<leader>d?"] = "lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>"
