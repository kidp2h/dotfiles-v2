local utils = require('utils.api')

vim.keymap.set('n', '<leader>h', function()
  require("harpoon.mark").add_file()
  vim.notify("Added this file", "info", {
    title = "[Harpoon]",
  })
end)
utils.map('n', '<leader>m', ':Telescope harpoon marks<cr>', "Toggle Harpoon Menu")
