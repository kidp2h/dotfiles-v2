local M = {}
M.copilot = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true
      },
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "left", -- | top | left | right
          ratio = 0.5
        },
      },
    })
  end,

}

M.chat = {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  opts = {
    debug = false, -- Enable debugging
    window = {
      layout = 'float',
      border = 'rounded',
      title = ' Copilot Chat ',
      position = "50%",
      relative = "cursor"

    }

    -- See Configuration section for rest
  },
  -- See Commands section for default commands if you want to lazy load on them
}

return M
