return {
	filetypes = { "javascriptreact", "typescriptreact", "svelte", "vue", "html", "css", "scss", "postcss" },
	on_attach = function(_, bufnr)
		if vim.bo.filetype == "javascriptreact" or vim.bo.filetype == "typescriptreact" then
			require("tailwindcss-colors").buf_attach(bufnr)
		end
	end,
	root_dir = function(fname)
		local util = require("lspconfig/util")
		return util.root_pattern(
			"tailwind.config.js",
			"tailwind.config.ts",
			"tailwind.config.cjs",
			"tailwind.js",
			"tailwind.ts",
			"tailwind.cjs"
		)(fname)
	end,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					"tw\\.style\\(([^)]*)\\)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
				},
			},
			classAttributes = {
				"class",
				"className",
				"ngClass",
				"style",
			},
		},
	},
}
