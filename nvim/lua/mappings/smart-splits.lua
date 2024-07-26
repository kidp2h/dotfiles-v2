local map = require('utils.api').map

map("n", "<M-Left>", "<cmd>lua require('smart-splits').resize_left()<CR>", "Resize left split")
map("n", "<M-Right>", "<cmd>lua require('smart-splits').resize_right()<CR>", "Resize right split")
map("n", "<M-Down>", "<cmd>lua require('smart-splits').resize_down()<CR>", "Resize down split")
map("n", "<M-Up>", "<cmd>lua require('smart-splits').resize_up()<CR>", "Resize up split")
map("n", "<Esc>", function()
  require('notify').dismiss()
end, "Close notify")
