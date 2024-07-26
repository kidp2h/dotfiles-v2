return {
	"VidocqH/lsp-lens.nvim",
	config = function()
		local icons = require("config.icons")
		require("lsp-lens").setup({
			enable = true,
			include_declaration = false, -- Reference include declaration
			sections = {
				definition = function(count)
					return "Definitions: " .. count
				end,
				references = function(count)
					return "References: " .. count
				end,
				implements = function(count)
					return "Implements: " .. count
				end,
				git_authors = function(latest_author, count)
					return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
				end,
			},
			ignore_filetype = {
				"prisma",
			},
			-- Target Symbol Kinds to show lens information
			target_symbol_kinds = { icons.kind.Function, icons.kind.Method, icons.kind.Interface },
			-- Symbol Kinds that may have target symbol kinds as children
			wrapper_symbol_kinds = { icons.kind.Class, icons.kind.Struct },
		})
	end,
}
