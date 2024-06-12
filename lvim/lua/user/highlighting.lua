local colors = require('dracula').colors()
lvim.autocommands = {
  {
    { "ColorScheme" },
    {

      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none", underline = false, bold = true });
        vim.api.nvim_set_hl(0, "WinBar", { bg = "none", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = 'none', fg = colors.fg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = colors.purple, fg = colors.fg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none', fg = colors.fg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = colors.purple, fg = colors.fg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = colors.purple, fg = colors.bg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = 'none', underline = false, bold = true })
        vim.api.nvim_set_hl(0, "Search", { bg = colors.green, fg = colors.bg, underline = false, bold = true })
        vim.api.nvim_set_hl(0, "WinSeparator",
          { bg = 'none', fg = colors.purple, underline = false, bold = true, blend = 100 })

        vim.api.nvim_set_hl(0, "NoiceLspProgressTitle",
          { bg = 'none', fg = colors.blue, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NoiceLspProgressTitle",
          { bg = 'none', fg = colors.blue, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NoiceLspProgressSpinner",
          { bg = 'none', fg = colors.purple, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NoiceLspProgressClient",
          { bg = 'none', fg = colors.purple, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NeoTreeTabActive",
          { bg = colors.purple, fg = colors.bg, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive",
          { bg = colors.purple, fg = colors.bg, underline = false, bold = true, })


        vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = 'none', underline = false, bold = true })
      end,
    },
  },
}
