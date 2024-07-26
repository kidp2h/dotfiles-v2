local M = {}

function M.map(mode, key, val, desc)
  vim.keymap.set(mode, key, val, { noremap = true, silent = true, desc = desc })
end

M.addCommand = vim.api.nvim_create_user_command

return M
