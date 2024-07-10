return {
  "yorickpeterse/nvim-window",
  keys = {
    { ",", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function()
    local colors = require('user.colors')
    vim.api.nvim_set_hl(0, "WindowHighlight", { bg = colors.purple, fg = colors.white, underline = false, bold = true })

    require('nvim-window').setup({
      -- The characters available for hinting windows.
      chars = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
        'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
      },
      normal_hl = 'WindowHighlight',
      hint_hl = 'Bold',
      border = 'none',
      window = {
        padding = 1
      }
    })
  end,
}
