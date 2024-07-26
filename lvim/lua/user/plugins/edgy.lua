return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		bottom = {
			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
			{
				ft = "trouble",
				pinned = true,
				title = "Trouble",
				open = "Trouble diagnostics",

				size = { height = 0.25, width = 0.5 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},

			{
				ft = "toggleterm",
				pinned = true,
				title = "Terminal",
				open = "ToggleTerm direction=vertical",

				size = { height = 0.25, width = 0.5 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
		right = {
			{
				ft = "sagaoutline",
				pinned = true,
				open = "Lspsaga outline",
				title = "Outline",
			},
		},
		left = {
			{
				title = "Neo-Tree",
				ft = "neo-tree",
			},
		},
	},
}
