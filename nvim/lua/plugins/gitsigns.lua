local icons = require("config.icons")
return {
	"lewis6991/gitsigns.nvim",
	enabled = true,
	config = function()
		require("gitsigns").setup({

			signs = {
				add = {
					text = icons.ui.BoldLineLeft,
				},
				change = {
					text = icons.ui.BoldLineLeft,
				},
				delete = {
					text = icons.ui.Triangle,
				},
				topdelete = {
					text = icons.ui.Triangle,
				},
				changedelete = {
					text = icons.ui.BoldLineLeft,
				},
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text_priority = 2049,
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 200,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			status_formatter = nil, -- Use default
			update_debounce = 200,
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
