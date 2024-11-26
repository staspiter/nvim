return {
	'petertriho/nvim-scrollbar',
	config = function()
		require('scrollbar').setup({
			handlers = {
				search = true,
			}
		})
	end,
}