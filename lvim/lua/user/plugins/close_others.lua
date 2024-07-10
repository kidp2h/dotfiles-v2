
local Input = require "nui.input"
local event = require("nui.utils.autocmd").event
local notify = require "notify"

local function closeOthers()
  vim.api.nvim_command('BufferLineCloseOthers')
end

local function acceptInput()
  local choice = vim.fn.confirm("Do you wanna close all other buffers?", "&Yes\n&No", 1)
  if(choice == 1) then
    closeOthers()
  end

-- local Menu = require("nui.menu")
-- local event = require("nui.utils.autocmd").event

-- local menu = Menu({
--   position = "50%",
--   size = {
--     width = 40,
--     height = 3,
--   },
--   border = {
--     style = "rounded",
--     text = {
--       top = "[Do you wanna close all other buffers?]",
--       top_align = "center",
--     },
--   },
--   win_options = {
--     winhighlight = "Normal:Normal,FloatBorder:Normal",
--   },
-- }, {
--   lines = {
--     Menu.item("Yes (Y)"),
--     Menu.item("No (N)"),
--   },
--   max_width = 20,
--   keymap = {
--     focus_next = { "j", "<Down>", "<Tab>" },
--     focus_prev = { "k", "<Up>", "<S-Tab>" },
--     close = { "<Esc>", "<C-c>" },
--     submit = { "<CR>", "<Space>" },
--   },
--   on_close = function()
--   end,
--   on_submit = function(item)
--     if(item.text == "Yes (Y)") then
--       closeOthers()
--     end
--   end,
-- })

-- -- mount the component
-- menu:mount()

-- menu:map("n", "y", menu.menu_props.on_submit, { noremap = true, nowait = true })
-- menu:map("n", "n", menu.menu_props.on_close, { noremap = true, nowait = true })
end

return {
  acceptInput = acceptInput,
}
