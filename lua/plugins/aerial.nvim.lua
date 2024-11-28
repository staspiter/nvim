return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    autojump = true,

    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
  },
  config = function(_, opts)
    require('aerial').setup(opts)
    -- Set a keymap to toggle aerial
    vim.keymap.set('n', '<leader>a', ':AerialToggle!<CR>', { desc = 'Toggle Aerial' })
  end,
}
