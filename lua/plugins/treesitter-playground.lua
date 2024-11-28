return {
  'nvim-treesitter/playground',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
  config = function()
    -- Optional: Set up Playground configuration if needed
    require('nvim-treesitter.configs').setup {
      playground = {
        enable = true,
        updatetime = 25, -- Debounced time for highlighting nodes
        persist_queries = false, -- Whether queries persist across sessions
      },
    }
  end,
}
