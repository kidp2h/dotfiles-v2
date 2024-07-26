local M = {}
M.setup = function(flavour, background)
	local scheme = "catppuccin-" .. flavour
	vim.cmd.colorscheme(scheme)
	vim.g.background = background
	local palette = require("catppuccin.palettes").get_palette(flavour)

	vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { bg = palette.mantle, fg = palette.mantle })
	vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = palette.mantle })
	vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false, bold = true })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true, bold = true, undercurl = false })
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true, bold = true, undercurl = false })
	vim.api.nvim_set_hl(0, "LspInlayHint", { bold = true })
	vim.api.nvim_set_hl(0, "WindowHighlight", { bg = palette.maroon, fg = palette.crust, underline = false, bold = true })
	vim.api.nvim_set_hl(0, "Folded", { bg = palette.surface0 })
	vim.api.nvim_set_hl(0, "FlashLabel", { bg = palette.mauve, fg = palette.crust })
	vim.api.nvim_set_hl(0, "EdgyWinbarNC", { bg = palette.mantle })
	vim.api.nvim_set_hl(0, "EdgyWinbar", { bg = palette.mantle })
	vim.api.nvim_set_hl(0, "EdgyTitle", { bg = palette.mantle, fg = palette.blue, bold = true })
	vim.api.nvim_set_hl(0, "EdgyIcon", { bg = palette.mantle, bold = true, fg = palette.text })
	vim.api.nvim_set_hl(0, "EdgyIconActive", { bg = palette.mantle, bold = true, fg = palette.peach })
	vim.api.nvim_set_hl(0, "WinSeparator", { bg = palette.base, fg = palette.base })

	vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = palette.crust, fg = palette.maroon })

	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = palette.crust, fg = palette.crust })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = palette.crust, fg = palette.maroon })

	vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.maroon, fg = palette.crust })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = palette.surface0, fg = palette.mauve })

	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = palette.crust, fg = palette.crust })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = palette.crust, fg = palette.text })

	vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.maroon, fg = palette.crust, bold = true })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = palette.crust, fg = palette.crust })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = palette.crust })

	vim.api.nvim_set_hl(0, "LspInlayHint", { link = "@comment.hint" })
	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "@comment.hint" })

	vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInActive", { bg = palette.crust, fg = palette.text })
	vim.api.nvim_set_hl(0, "NeoTreeTabInActive", { bg = palette.crust, fg = palette.fg })
	vim.api.nvim_set_hl(
		0,
		"NeoTreeTabActive",
		{ bg = palette.lavender, fg = palette.crust, underline = false, bold = true }
	)
	vim.api.nvim_set_hl(
		0,
		"NeoTreeTabSeparatorActive",
		{ bg = palette.lavender, fg = palette.crust, underline = false, bold = true }
	)

	vim.api.nvim_set_hl(0, "Pmenu", { bg = palette.surface0, fg = palette.text, bold = false })
	vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "none", underline = false, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = palette.subtext1, bg = "NONE", strikethrough = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = palette.maroon, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = palette.maroon, bold = true })
	vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = palette.mauve, bg = "NONE", italic = true })

	vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = palette.crust, bg = palette.maroon })
	vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = palette.crust, bg = palette.maroon })
	vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = palette.crust, bg = palette.lavender })

	vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = palette.crust, bg = palette.yellow })
	vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = palette.crust, bg = palette.pink })
	vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = palette.crust, bg = palette.pink })
	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = palette.crust, bg = palette.overlay2 })

	vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = palette.crust, bg = palette.mauve })
	vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = palette.crust, bg = palette.mauve })
	vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = palette.crust, bg = palette.mauve })

	vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = palette.crust, bg = palette.green })
	vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = palette.crust, bg = palette.green })
	vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = palette.crust, bg = palette.sky })
	vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = palette.crust, bg = palette.green })
	vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = palette.crust, bg = palette.green })

	vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = palette.crust, bg = palette.sapphire })
	vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = palette.crust, bg = palette.sapphire })

	vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = palette.crust, bg = palette.maroon })
	vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = palette.crust, bg = palette.maroon })
	vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = palette.crust, bg = palette.maroon })

	vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = palette.crust, bg = palette.green })

	vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = palette.crust, bg = palette.peach })
	vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = palette.crust, bg = palette.peach })

	vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = palette.crust, bg = palette.sapphire })

	vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = palette.crust, bg = palette.pink })
	vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = palette.crust, bg = palette.peach })

	vim.api.nvim_set_hl(0, "Todo", { fg = palette.crust, bg = palette.mauve })
	vim.api.nvim_set_hl(0, "Error", { fg = palette.crust, bg = palette.maroon })
	vim.api.nvim_set_hl(0, "Info", { fg = palette.crust, bg = palette.sky })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = palette.crust, bg = palette.yellow })

	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = palette.mantle, fg = palette.mantle })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { bg = palette.mantle, fg = palette.mantle })

	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleCmdline", { bg = palette.blue, fg = palette.crust })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleSearch", { bg = palette.yellow, fg = palette.crust })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitleLua", { bg = palette.blue, fg = palette.crust })
	vim.api.nvim_set_hl(0, "NoiceCmdlineIconLua", { bg = palette.crust, fg = palette.sky })
	vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = palette.blue, fg = palette.crust })

	vim.api.nvim_set_hl(0, "FloatBorder", { bg = palette.mantle, fg = palette.mantle })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = palette.maroon, fg = palette.crust })
	vim.api.nvim_set_hl(0, "RenameNormal", { bg = palette.mantle, fg = palette.maroon })
	vim.api.nvim_set_hl(0, "SagaTitle", { bg = palette.maroon, fg = palette.crust })
	vim.api.nvim_set_hl(0, "SagaActionTitle", { bg = palette.maroon, fg = palette.crust })
	vim.api.nvim_set_hl(0, "SagaButton", { bg = palette.mantle, fg = palette.maroon })
	vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = palette.maroon, fg = palette.crust })
	vim.api.nvim_set_hl(0, "AlphaHeader", { underline = false, fg = palette.maroon })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = palette.sky })
	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "@comment.info" })
	vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextError", { bg = palette.surface0, fg = palette.maroon })
	vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextHint", { bg = palette.surface0, fg = palette.sky })
	vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextInfo", { bg = palette.surface0, fg = palette.blue })
	vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextWarn", { bg = palette.surface0, fg = palette.yellow })

	local cursorLine = vim.api.nvim_get_hl_by_name("CursorLine", true)
	vim.api.nvim_set_hl(
		0,
		"TinyInlineInvDiagnosticVirtualTextError",
		{ bg = cursorLine.background, fg = palette.surface0 }
	)
	vim.api.nvim_set_hl(
		0,
		"TinyInlineInvDiagnosticVirtualTextHint",
		{ bg = cursorLine.background, fg = palette.surface0 }
	)
	vim.api.nvim_set_hl(
		0,
		"TinyInlineInvDiagnosticVirtualTextInfo",
		{ bg = cursorLine.background, fg = palette.surface0 }
	)
	vim.api.nvim_set_hl(
		0,
		"TinyInlineInvDiagnosticVirtualTextWarn",
		{ bg = cursorLine.background, fg = palette.surface0 }
	)

	-- setup lualine

	local M = {
		options = {
			icons_enabled = true,
			disabled_filetypes = { "alpha", statusline = {}, winbar = {} },
			-- component_separators = "",
			-- section_separators = "",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			theme = {
				-- We are going to use lualine_c an lualine_x as left and
				-- right section. Both are highlighted by c theme .  So we
				-- are just setting default looks o statusline
				normal = { c = { fg = palette.fg, bg = "#00000000" } },
				inactive = { c = { fg = palette.fg, bg = "#00000000" } },
			},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	}
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	-- Inserts a component in lualine_c at left section
	local function ins_left(component)
		table.insert(M.sections.lualine_c, component)
	end

	local function ins_right(component)
		table.insert(M.sections.lualine_x, component)
	end

	-- ins_left {
	--   function()
	--     return '▊'
	--   end,
	--   color = { fg = colors.blue },      -- Sets highlighting of component
	--   padding = { left = 0, right = 1 }, -- We don't need space before this
	-- }

	ins_left({
		-- mode component
		function()
			local modeMap = {
				["n"] = " normal",
				["no"] = " n·operator pending",
				["v"] = " visual",
				["V"] = " v·line",
				[""] = " v·block",
				["s"] = " select",
				["S"] = " s·line",
				[""] = " s·block",
				["i"] = " insert",
				["R"] = " replace",
				["Rv"] = " v·replace",
				["c"] = " command",
				["cv"] = " vim ex",
				["ce"] = " ex",
				["r"] = " prompt",
				["rm"] = " more",
				["r?"] = " confirm",
				["!"] = " shell",
				["t"] = " terminal",
			}
			return "  " .. string.upper(modeMap[vim.fn.mode()])
		end,
		color = function()
			-- auto change color according to neovims mode
			local mode_color = {
				n = palette.maroon,
				i = palette.green,
				v = palette.blue,
				[""] = palette.blue,
				V = palette.blue,
				c = palette.lavender,
				no = palette.maroon,
				s = palette.peach,
				S = palette.peach,
				[""] = palette.peach,
				ic = palette.yellow,
				R = palette.pink,
				Rv = palette.pink,
				cv = palette.maroon,
				ce = palette.maroon,
				r = palette.sky,
				rm = palette.sky,
				["r?"] = palette.sky,
				["!"] = palette.maroon,
				t = palette.maroon,
			}
			return { fg = palette.base, bg = mode_color[vim.fn.mode()] }
		end,
		padding = { right = 1 },
	})

	ins_left({
		-- filesize component
		"filesize",
		color = { fg = palette.base, bg = palette.pink, gui = "bold" },
		cond = conditions.buffer_not_empty,
	})

	ins_left({
		"filename",
		cond = conditions.buffer_not_empty,
		color = { fg = palette.base, bg = palette.mauve, gui = "bold" },
	})

	ins_left({ "location", color = { fg = palette.base, bg = palette.blue, gui = "bold" } })

	ins_left({ "progress", color = { fg = palette.base, bg = palette.green, gui = "bold" } })

	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " " },
		color = {
			fg = palette.base,
			bg = palette.mantle,
		},
		diagnostics_color = {
			color_error = { fg = palette.maroon },
			color_warn = { fg = palette.yellow },
			color_info = { fg = palette.blue },
		},
	})

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left({
		function()
			return "%="
		end,
	})

	ins_left({
		-- Lsp server name .
		function()
			-- local msg = 'Nothing'
			local msg = ""
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				-- return msg
				return ""
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			-- return msg
			return ""
		end,
		icon = "",
		-- icon = '  LSP:',
		color = { fg = palette.base, bg = palette.maroon, gui = "bold" },
	})

	-- Add components to right sections
	ins_right({
		"o:encoding", -- option component same as &encoding in viml
		fmt = string.upper, -- I'm not sure why it's upper case either ;)
		cond = conditions.hide_in_width,
		color = { fg = palette.base, bg = palette.green, gui = "bold" },
	})

	ins_right({
		"fileformat",
		fmt = string.upper,
		icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
		color = { fg = palette.base, bg = palette.sapphire, gui = "bold" },
	})

	ins_right({
		"branch",
		icon = "",
		color = { fg = palette.base, bg = palette.pink, gui = "bold" },
	})

	ins_right({
		"diff",
		-- Is it me or the symbol for modified us really weird
		symbols = { added = " ", modified = " 󰝤 ", removed = "  " },
		diff_color = {
			added = { fg = palette.base, bg = palette.green },
			modified = { fg = palette.base, bg = palette.peach },
			removed = { fg = palette.base, bg = palette.maroon },
		},
		cond = conditions.hide_in_width,
	})

	ins_right({
		function()
			return ""
		end,
		color = { fg = palette.blue },
		padding = { left = 1 },
	})

	require("lualine").setup({
		options = M.options,
		sections = M.sections,
		inactive_sections = M.inactive_sections,
		tabline = M.tabline,
		extensions = M.extensions,
	})
end

return M
--[[ rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b", ]]
