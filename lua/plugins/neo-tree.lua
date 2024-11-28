vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    --'3rd/image.nvim', -- images preview support
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        window = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          mappings = {
            ['\\'] = 'close_window',
          },
          hijack_netrw_behavior = 'open_default',
          use_libuv_file_watcher = true,
        },
      },
    }

    vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
  end,
}
