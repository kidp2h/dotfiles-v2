return {
  "yorickpeterse/nvim-window",
  keys = {
    { ",", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
  },
  config = function()
    require("nvim-window").setup({
      -- The characters available for hinting windows.
      chars = {
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z",
      },
      normal_hl = "WindowHighlight",
      hint_hl = "Bold",
      border = "none",
      window = {
        padding = 10,
      },
    })
  end,
}
