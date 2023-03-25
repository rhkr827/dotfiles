local status, github = pcall(require, 'github-theme')
if not status then return end


github.setup({
  theme_style = "dimmed",
  comment_style = "italic",
  keyword_style = "italic",
  function_style = "italic",
  variable_style = "italic",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  colors = { hint = "orange", error = "#ff0000" },
  transparent = false,
  dark_float = true,
  dark_sidebar = true,
  hide_end_of_buffer = true,
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      TSField = {},
    }
  end
})
