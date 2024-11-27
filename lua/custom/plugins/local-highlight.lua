return {
  'tzachar/local-highlight.nvim',
  config = function()
    require('local-highlight').setup {
      disable_file_types = { 'tex' },
      hlgroup = 'Search',
      cw_hlgroup = nil,
      -- Whether to display highlights in INSERT mode or not
      insert_mode = true,
      min_match_len = 1,
      max_match_len = math.huge,
      highlight_single_match = true,
    }
  end,
}
