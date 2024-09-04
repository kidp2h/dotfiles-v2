return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
				Normal = {
					guibg = "ffffff",
				},
				NormalFloat = {
					link = "Normal",
				},
			},
		})
	end,
}
