local colors = require("user.colors")
lvim.builtin.lualine.options = {
	icons_enabled = true,
	-- component_separators = "",
	-- section_separators = "",
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
	theme = {
		-- We are going to use lualine_c an lualine_x as left and
		-- right section. Both are highlighted by c theme .  So we
		-- are just setting default looks o statusline
		normal = { c = { fg = colors.fg, bg = "#00000000" } },
		inactive = { c = { fg = colors.fg, bg = "#00000000" } },
	},
}
lvim.builtin.lualine.sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
}
lvim.builtin.lualine.inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {},
	lualine_x = {},
	lualine_y = {},
	lualine_z = {},
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
	table.insert(lvim.builtin.lualine.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(lvim.builtin.lualine.sections.lualine_x, component)
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
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.pink,
			Rv = colors.pink,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = colors.white, bg = mode_color[vim.fn.mode()] }
	end,
	padding = { right = 1 },
})

ins_left({
	-- filesize component
	"filesize",
	color = { fg = colors.white, bg = colors.pink, gui = "bold" },
	cond = conditions.buffer_not_empty,
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	color = { fg = colors.white, bg = colors.magenta, gui = "bold" },
})

ins_left({ "location", color = { fg = colors.white, bg = colors.blue, gui = "bold" } })

ins_left({ "progress", color = { fg = colors.white, bg = colors.green, gui = "bold" } })

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	color = {
		fg = colors.white,
		bg = colors.fg,
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.blue },
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
	color = { fg = colors.white, bg = colors.red, gui = "bold" },
})

-- Add components to right sections
ins_right({
	"o:encoding", -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.white, bg = colors.green, gui = "bold" },
})

ins_right({
	"fileformat",
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.white, bg = colors.purple, gui = "bold" },
})

ins_right({
	"branch",
	icon = "",
	color = { fg = colors.white, bg = colors.pink, gui = "bold" },
})

ins_right({
	"diff",
	-- Is it me or the symbol for modified us really weird
	symbols = { added = " ", modified = " 󰝤 ", removed = "  " },
	diff_color = {
		added = { fg = colors.white, bg = colors.green },
		modified = { fg = colors.white, bg = colors.orange },
		removed = { fg = colors.white, bg = colors.red },
	},
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.blue },
	padding = { left = 1 },
})

-- Now don't forget to initialize lualine
