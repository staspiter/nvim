return {
  'rebelot/kanagawa.nvim',
  config = function()
    -- Default options:
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = 'none',
              bg = '#000000',
              whitespace = '#282727',
            },
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = 'dragon', -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        light = 'lotus',
      },
    }

    -- setup must be called before loading
    vim.cmd 'colorscheme kanagawa'

    vim.cmd [[
      highlight LineNr guifg=#282727 guibg=NONE
      highlight CursorLineNr guifg=#282727 guibg=NONE
      highlight SignColumn guifg=#282727 guibg=NONE
      highlight CursorLine guibg=#1f1e1e guifg=NONE
      highlight NeoTreeTitleBar guifg=#ffffff guibg=NONE
    ]]
  end,
}
