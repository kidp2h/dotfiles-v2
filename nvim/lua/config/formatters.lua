local formatters = {
	lua = { "stylua" },
	javascript = { "prettierd", "eslint_d" },
	typescript = { "prettierd", "eslint_d" },
	typescriptreact = { "prettierd", "eslint_d" },
	javascriptreact = { "prettierd", "eslint_d" },
	yaml = { "yamlfmt", "yamlfix" },
}
return formatters
