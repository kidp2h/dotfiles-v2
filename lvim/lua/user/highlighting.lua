local colors = require('user.colors')
lvim.autocommands = {
  {
    { "ColorScheme" },
    {

      pattern = "*",
      callback = function()
        local isTransparent = lvim.transparent_window

        -- Transparent
        if (isTransparent) then
          vim.api.nvim_set_hl(0, "WinBarNC", { bg = "none", underline = false, bold = true });
          vim.api.nvim_set_hl(0, "WinBar", { bg = "none", underline = false, bold = true })
          vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none", underline = false, bold = true })
          vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none", underline = false, bold = true })
          vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none", underline = false, bold = true })
          vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = 'none', fg = colors.fg, underline = false, bold = true })
          vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = colors.purple, fg = colors.fg, underline = false, bold = true })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none', fg = colors.fg, underline = false, bold = true })
          vim.api.nvim_set_hl(0, "FloatTitle", { bg = colors.purple, fg = colors.fg, underline = false, bold = true })
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

          vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = 'none', underline = false, bold = true })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none", fg = "NONE" })
          vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "none" })

          vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",
            { bg = "none", fg = colors.bright_magenta, underline = true, bold = true, italic = true })
          vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = 'none', underline = false, bold = true })
          vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
          vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
          vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

          vim.api.nvim_set_hl(0, "LspInlayHint", { bg = 'none', fg = '#969696' })
        end


        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInActive", { bg = colors.white, fg = colors.fg })
        vim.api.nvim_set_hl(0, "NeoTreeTabInActive", { bg = colors.white, fg = colors.fg })
        vim.api.nvim_set_hl(0, "NeoTreeTabActive",
          { bg = colors.magenta, fg = colors.white, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive",
          { bg = colors.magenta, fg = colors.bg, underline = false, bold = true, })

        vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.white, bg = colors.red })
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = colors.white, bg = colors.red })
        vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = colors.white, bg = colors.magenta })

        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.white, bg = colors.yellow })
        vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = colors.white, bg = colors.pink })
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.white, bg = colors.pink })

        vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.white, bg = colors.purple })
        vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.white, bg = colors.purple })
        vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = colors.white, bg = colors.purple })

        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.white, bg = colors.green })
        vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = colors.white, bg = colors.green })
        vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.white, bg = colors.cyan })
        vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.white, bg = colors.green })
        vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = colors.white, bg = colors.green })

        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.bg, bg = colors.fg })
        vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.bg, bg = colors.fg })

        vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = colors.white, bg = colors.red })
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.white, bg = colors.red })
        vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = colors.white, bg = colors.red })

        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.white, bg = colors.green })

        vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = colors.white, bg = colors.orange })
        vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = colors.white, bg = colors.orange })

        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.white, bg = colors.bg })

        vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = colors.white, bg = colors.pink })
        vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = colors.white, bg = colors.orange })

        vim.api.nvim_set_hl(0, "Todo", { fg = colors.white, bg = colors.purple })
        vim.api.nvim_set_hl(0, "Error", { fg = colors.white, bg = colors.red })
        vim.api.nvim_set_hl(0, "Info", { fg = colors.white, bg = colors.cyan })
        vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.white, bg = colors.yellow })
      end,
    },
  },
}
