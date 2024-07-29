return {
	"L3MON4D3/LuaSnip",
	config = function()
		local paths = {}
		local utils = require("utils.commons")
		paths[#paths + 1] =
			utils.join_paths(vim.api.nvim_list_runtime_paths()[1], "site", "pack", "lazy", "opt", "friendly-snippets")
		require("luasnip.loaders.from_vscode").load({})

		--[[ require("luasnip.loaders.from_vscode").lazy_load({
			paths = paths,
		}) ]]

		require("luasnip.loaders.from_snipmate").lazy_load()
	end,
	dependencies = { "rafamadriz/friendly-snippets" },
}
