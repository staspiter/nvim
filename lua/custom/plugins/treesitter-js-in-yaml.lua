return {
  'nvim-treesitter/nvim-treesitter',
  opts = function(_, opts)
    opts.highlight = opts.highlight or { enable = true }
    opts.highlight.enable = true

    opts.ensure_installed = vim.tbl_extend('force', opts.ensure_installed or {}, { 'yaml', 'javascript' })

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.yaml.used_by = { 'yaml', 'yaml.custom' }

    vim.treesitter.query.set(
      'yaml',
      'injections',
      [[
        (block_mapping_pair
          key: (flow_node) @_run
          (#any-of? @_run "js")
          value: (flow_node
            (plain_scalar
              (string_scalar) @injection.content)
            (#set! injection.language "javascript")))

        (block_mapping_pair
          key: (flow_node) @_run
          (#any-of? @_run "js")
          value: (block_node
            (block_scalar) @injection.content
            (#set! injection.language "javascript")
            (#offset! @injection.content 0 1 0 0)))

        (block_mapping_pair
          key: (flow_node) @_run
          (#any-of? @_run "js")
          value: (block_node
            (block_sequence
              (block_sequence_item
                (flow_node
                  (plain_scalar
                    (string_scalar) @injection.content))
                (#set! injection.language "javascript")))))
      ]]
    )
  end,
}
