local status, wilder = pcall(require, 'wilder')
if (not status) then return end

wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('renderer', wilder.wildmenu_renderer({
  -- highlighter applies highlighting to the candidates
  highlighter = wilder.basic_highlighter(),
}))

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    border = 'rounded',
    max_height = '50%',
    prompt_position = 'center',
    reverse = 0,
  })
))
