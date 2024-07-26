return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.splitkeep = "screen"
	end,
	opts = {
		animate = {
			enabled = false,
			fps = 100, -- frames per second
			cps = 400, -- cells per second
			on_begin = function()
				vim.g.minianimate_disable = false
			end,
			on_end = function()
				vim.g.minianimate_disable = true
			end,
			-- Spinner for pinned views that are loading.
			-- if you have noice.nvim installed, you can use any spinner from it, like:
			-- spinner = require("noice.util.spinners").spinners.circleFull,
			spinner = {
				frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
				interval = 80,
			},
		},
		keys = {
			-- increase width
			["<c-w>>"] = function(win)
				win:resize("width", 2)
			end,
			-- decrease width
			["<c-w><lt>"] = function(win)
				win:resize("width", -2)
			end,
			-- increase height
			["<c-w>+"] = function(win)
				win:resize("height", 2)
			end,
			-- decrease height
			["<c-w>-"] = function(win)
				win:resize("height", -2)
			end,
			-- reset all custom sizing
			["<c-w>="] = function(win)
				win.view.edgebar:equalize()
			end,
		},
		bottom = {

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

			{
				ft = "spectre_panel",
				pinned = true,
				title = "Spectre",
				open = "Spectre",

				size = { height = 0.25, width = 0.5 },
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

				size = { width = 0.26 },
			},
		},
	},
}
