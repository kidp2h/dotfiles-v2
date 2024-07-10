local palette = require('github-theme.palette').load('github_light')
local Color = require('github-theme.lib.color')


local M = {
  bg      = palette.canvas.default,
  fg      = palette.black.base,
  white   = "#FFFFFF",
  yellow  = palette.yellow.bright,
  cyan    = palette.cyan.bright,
  green   = palette.green.bright,
  orange  = palette.orange,
  magenta = palette.magenta.bright,
  blue    = palette.blue.bright,
  red     = palette.red.bright,
  pink    = palette.pink.bright,
  purple  = "#683BBB"
}

-- print(vim.inspect(M))

return M;
