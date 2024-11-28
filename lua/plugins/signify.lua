return {
  'mhinz/vim-signify',
  config = function()
    vim.cmd [[
      highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
      highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
      highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
    ]]

    vim.cmd [[
      function! s:sy_stats_wrapper()
        let [added, modified, removed] = sy#repo#get_stats()
        let symbols = ['+', '-', '~']
        let stats = [added, removed, modified]  " reorder
        let statline = ''

        for i in range(3)
          if stats[i] > 0
            let statline .= printf('%s%s ', symbols[i], stats[i])
          endif
        endfor

        if !empty(statline)
          let statline = printf('[%s]', statline[:-2])
        endif

        return statline
      endfunction

      function! MyStatusline()
        return ' %f '. s:sy_stats_wrapper()
      endfunction

      set statusline=%!MyStatusline()
    ]]
  end,
}
