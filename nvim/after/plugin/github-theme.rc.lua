local status, github = pcall(require, 'github-theme')
if not status then return end

github.setup({
  theme_style = "dimmed",
  function_style = "NONE",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = "orange", error = "#ff0000" },
  transparent = false,
  dark_float = true,
  dark_sidebar = true,
  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})
