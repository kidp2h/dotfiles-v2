local palette = require("github-theme.palette").load("github_light")
local _palette = require("catppuccin.palettes").get_palette("latte")
local Color = require("github-theme.lib.color")

local M = {
	bg = palette.canvas.default,
	fg = palette.black.base,
	white1 = "#F3F4F6",
	white2 = "#F6F8FA",
	white3 = "#e3e3e5",
	gray = "#373f47",
	white = "#FFFFFF",
	yellow = palette.yellow.base,
	cyan = palette.cyan.bright,
	green = palette.green.base,
	orange = palette.orange,
	magenta = palette.magenta.base,
	blue = palette.blue.base,
	red1 = palette.red.bright,
	red2 = palette.red.base,
	red3 = "#DC5D66",
	red = _palette.red,
	sapphire = _palette.sapphire,
	pink = palette.pink.bright,
	purple = _palette.lavender,
}

-- print(vim.inspect(_palette))

return M
