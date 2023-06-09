local status, db = pcall(require, "dashboard")
if (not status) then
  print("dashboard is not installed")
  return
end

db.setup({
  theme = "hyper",
  config = {
    week_header = {
      enable = true,
    },
    packages = { enable = true },
    shortcut = {
      {
        desc = " Files",
        group = "Number",
        action = "Telescope find_files",
        key = "f",
      },
      {
        desc = " Projects",
        group = "Number",
        action = "Telescope projects",
        key = "p",
      },
      {
        desc = "󰘥 Help",
        group = "Number",
        action = "Telescope help_tags",
        key = "h",
      },
      {
        desc = " dotfiles",
        group = "Number",
        action = "lua require'config.telescope'.nvim_config()",
        key = "d",
      },
    },
    project = { enable = false, limit = 10, icon = '', label = '  Recent Projects', action = 'Telescope projects' },
    mru = { enable = true, limit = 10, icon = '', label = '  Most Recent Files' },
    footer = {},
  },
})
