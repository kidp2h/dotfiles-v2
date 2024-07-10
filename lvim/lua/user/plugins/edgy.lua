return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        pinned = true,
        title = "Terminal",
        open = "ToggleTerm direction=vertical",

        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
    },
    right = {
      {
        ft = "Outline",
        pinned = true,
        open = "Outline",
      },
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        pinned = true,
        open = function()
          vim.cmd("Neotree")
        end,
      },
      {
        title = "Search & Replace",
        ft = "spectre_panel",
        open = "Spectre",
        pinned = true,
      }
    },
  },
}
