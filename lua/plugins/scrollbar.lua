return {
  'petertriho/nvim-scrollbar',
  config = function()
    require('scrollbar').setup {
      show = true,
      show_in_active_only = false,
      set_highlights = true,
      folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
      max_lines = false, -- disables if no. of lines in buffer exceeds this
      hide_if_all_visible = false, -- Hides everything if all lines are visible
      throttle_ms = 100,
      override_lens = function() end,
      handle = {
        text = ' ',
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color_nr = nil, -- cterm
        color = '#383635',
        hide_if_all_visible = false, -- Hides handle if all lines are visible
      },
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = true, -- Requires hlslens
        ale = false, -- Requires ALE
      },
    }
  end,
}
