local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local config = {
  options = {
    icons_enabled = true,
    theme = 'github_dimmed',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}

-- CMake settings

local cmake = require("cmake-tools")
local icons = require("config.icons")

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    local c_preset = cmake.get_configure_preset()
    return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectConfigurePreset")
      end
    end
  end
}

ins_left {
  function()
    local type = cmake.get_build_type()
    return "CMake: [" .. (type and type or "") .. "]"
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildType")
      end
    end
  end
}

ins_left {
  function()
    local kit = cmake.get_kit()
    return "[" .. (kit and kit or "X") .. "]"
  end,
  icon = icons.ui.Pencil,
  cond = function()
    return cmake.is_cmake_project() and not cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectKit")
      end
    end
  end
}

ins_left {
  function()
    return "Build"
  end,
  icon = icons.ui.Gear,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeBuild")
      end
    end
  end
}

ins_left {
  function()
    local b_preset = cmake.get_build_preset()
    return "[" .. (b_preset and b_preset or "X") .. "]"
  end,
  icon = icons.ui.Search,
  cond = function()
    return cmake.is_cmake_project() and cmake.has_cmake_preset()
  end,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildPreset")
      end
    end
  end
}

ins_left {
  function()
    local b_target = cmake.get_build_target()
    return "[" .. (b_target and b_target or "X") .. "]"
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectBuildTarget")
      end
    end
  end
}

ins_left {
  function()
    return icons.ui.Debug
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeDebug")
      end
    end
  end
}

ins_left {
  function()
    return icons.ui.Run
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeRun")
      end
    end
  end
}

ins_left {
  function()
    local l_target = cmake.get_launch_target()
    return "[" .. (l_target and l_target or "X") .. "]"
  end,
  cond = cmake.is_cmake_project,
  on_click = function(n, mouse)
    if (n == 1) then
      if (mouse == "l") then
        vim.cmd("CMakeSelectLaunchTarget")
      end
    end
  end
}

-- Now don't forget to initialize lualine
lualine.setup(config)
