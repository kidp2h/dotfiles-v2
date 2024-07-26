local gitsigns = reload("gitsigns")
lvim.builtin.gitsigns = {
	active = true,
	on_config_done = nil,
	opts = {
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = lvim.icons.ui.BoldLineLeft,
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = lvim.icons.ui.BoldLineLeft,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = lvim.icons.ui.Triangle,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = lvim.icons.ui.Triangle,
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = lvim.icons.ui.BoldLineLeft,
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
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
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 100,
			ignore_whitespace = false,
			virt_text_priority = 9999,
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
		yadm = { enable = false },
	},
}
require("gitsigns").setup(lvim.builtin.gitsigns.opts)
