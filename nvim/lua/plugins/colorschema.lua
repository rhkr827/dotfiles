return{    -- github theme
    {
      "projekt0n/github-nvim-theme",
      lazy = true,
      config = function()
        require("github-theme").setup({
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
        })
      end
    },
  }
