local x = 5
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-inline-diagnostic").setup({
			signs = {
				left = "",
				right = "",
				diag = "●",
				arrow = "    ",
				up_arrow = "    ",
				vertical = " │",
				vertical_end = " └",
			},
			hi = {
				error = "DiagnosticError",
				warn = "DiagnosticWarn",
				info = "DiagnosticInfo",
				hint = "DiagnosticHint",
				arrow = "NonText",
				background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
				mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
			},
			blend = {
				factor = 0.27,
			},
			options = {
				multiple_diag_under_cursor = true,
				-- Throttle the update of the diagnostic when moving cursor, in milliseconds.
				-- You can increase it if you have performance issues.
				-- Or set it to 0 to have better visuals.
				throttle = 20,

				-- The minimum length of the message, otherwise it will be on a new line.
				softwrap = 15,

				overflow = {
					-- Manage the overflow of the message.
					--    - wrap: when the message is too long, it is then displayed on multiple lines.
					--    - none: the message will not be truncated, and will be displayed on a single line.
					mode = "wrap",

					-- The position of the overflow message.
					--    - overlay: The message is displayed on top of the line. Do not move lines forward, it writes over the text.
					--    - eol: The message is displayed at the end of the line. Will move lines forward.
					position = "eol",
				},
				show_source = true,

				--- Enable it if you want to always have message with `after` characters length.
				break_line = {
					enabled = false,
					after = 30,
				},
				virt_texts = {
					priority = 2048,
				},
			},
		})
	end,
}
