return {
	'kevinhwang91/nvim-hlslens',
		config = function()
			require('hlslens').setup({
		   build_position_cb = function(plist, _, _, _)
				require("scrollbar.handlers.search").handler.show(plist.start_pos)
		   end,
		override_lens = function() end,
		})
		
		-- Keybindings for using hlslens with n/N
		local kopts = { noremap = true, silent = true }

		vim.api.nvim_set_keymap('n', 'n',
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', 'N',
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		
		vim.cmd([[
			augroup scrollbar_search_hide
				autocmd!
				autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
			augroup END
		]])
	end
}