local map = require('utils.api').map

map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", "Next Buffer")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer")
map("n", "<M-Tab>", "<cmd>BufferLinePick<CR>", "Pick Buffer")
