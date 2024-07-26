return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.prisma_format,
			},
			on_attach = function(client, bufnr) end,
		})
	end,

	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
}
