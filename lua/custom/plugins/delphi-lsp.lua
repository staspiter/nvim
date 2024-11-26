return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
	  local capabilities = require("cmp_nvim_lsp").default_capabilities()
	  local lspconfig = require("lspconfig")

	  lspconfig.delphi_ls.setup({
		capabilities = capabilities,

		on_attach = function(client)
		  local lsp_config = vim.fs.find(function(name)
			return name:match(".*%.delphilsp.json$")
		  end, { type = "file", path = client.config.root_dir, upward = false })[1]

		  if lsp_config then
			client.config.settings = { settingsFile = lsp_config }
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		  else
			vim.notify_once("delphi_ls: '*.delphilsp.json' config file not found")
		  end
		end,
	  })
	end,
}