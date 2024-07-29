local M = {}

M.setup = function(servers)
	for _, server in ipairs(servers) do
		local status, config = pcall(require, "lsp.servers." .. server)

		if config.capabilities == nil then
			config = {
				capabilities = require("lsp.commons").capabilities,
				on_attach = config.on_attach,
				settings = config.settings,
			}
		end
		require("lspconfig")[server].setup({
			capabilities = config.capabilities,
			on_attach = function(client, bufnr)
				require("lsp.commons").on_attach(client, bufnr)

				if config.on_attach ~= nil then
					config.on_attach(client, bufnr)
				end
			end,
			on_init = function(client, bufnr)
				require("lsp.commons").on_init(client, bufnr)
				if config.on_init ~= nil then
					config.on_init(client, bufnr)
				end
			end,
			settings = config.settings,
		})
	end
end
M.servers = {
	"prismals",
	"tsserver",
	"lua_ls",
	"tailwindcss",
	"dockerls",
	"yamlls",
	"html",
	"graphql",
	"gopls",
	"css_variables",
	"cssls",
	"cssmodules_ls",
	"jsonls",
	"docker_compose_language_service",
}
return M
