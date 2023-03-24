local status, cmake = pcall(require, "cmake-tools")
if (not status) then return end

local Path = require('plenary.path')
cmake.setup({
  cmake_command = "cmake",
  cmake_build_directory = "",
  cmake_build_directory_prefix = "build/",
  cmake_build_type = "Debug",
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = {},
  cmake_console_size = 30,               -- cmake output window height
  cmake_show_console = "always",         -- "always", "only_on_error"
  cmake_console_position = "belowright", -- "belowright", "aboveleft", ...
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 }
  },
  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  }, -- dap configuration, optional
})
