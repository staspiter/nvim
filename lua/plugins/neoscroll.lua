return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup {
      respect_scrolloff = true,
      duration_multiplier = 0,
    }
  end,
}
