local map = require('utils.api').map
map("n", "<M-e>", function()
  local ft = vim.bo.filetype
  if (ft == "neo-tree") then
    vim.cmd("Neotree toggle")
  else
    vim.cmd("Neotree focus")
  end
end, "File Explorer")
