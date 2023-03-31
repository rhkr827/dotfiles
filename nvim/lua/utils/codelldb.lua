local M = {}

local is_unix = vim.fn.has("unix") == 1
local is_win32 = vim.fn.has("win32") == 1
local is_wsl = vim.fn.has("wsl") == 1
local extension_path
local codelldb_path
local liblldb_path

if is_wsl then
  extension_path = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/"
  codelldb_path = extension_path .. "adapter/codelldb"
  liblldb_path = extension_path .. "lldb/lib/liblldb.lib"
elseif is_unix then
  extension_path = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/"
  codelldb_path = extension_path .. "adapter/codelldb"
  liblldb_path = extension_path .. "lldb\\lib\\liblldb.lib"
elseif is_win32 then
  extension_path = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/"
  codelldb_path = extension_path .. "adapter/codelldb"
  liblldb_path = extension_path .. "lldb\\lib\\liblldb.lib"
end

M.codelldb_path = codelldb_path
M.liblldb_path = liblldb_path

return M
