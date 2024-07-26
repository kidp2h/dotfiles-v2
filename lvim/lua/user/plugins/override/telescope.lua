lvim.builtin.telescope.defaults = {
	selection_caret = "  ",
	entry_prefix = "  ",
	layout_strategy = "horizontal",
	initial_mode = "insert",
	color_devicons = true,
	prompt_prefix = "   ",
	borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
	file_ignore_patterns = { "node_modules", "*.lock", "package.json" },
	path_display = { "smart" },
	layout_config = {
		horizontal = {
			prompt_position = "top",
			preview_width = 0.55,
			results_width = 0.8,
		},
		vertical = {
			mirror = false,
		},
		width = 0.9,
		height = 0.80,
		preview_cutoff = 120,
	},
}
