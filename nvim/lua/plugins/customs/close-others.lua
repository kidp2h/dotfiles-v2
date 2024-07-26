local Input = require "nui.input"
local event = require("nui.utils.autocmd").event
local notify = require "notify"

local function closeOthers()
  vim.api.nvim_command('BufferLineCloseOthers')
end

local function acceptInput()
  local choice = vim.fn.confirm("Do you wanna close all other buffers?", "&Yes\n&No", 1)
  if (choice == 1) then
    closeOthers()
  end
end

return {
  acceptInput = acceptInput,
}
