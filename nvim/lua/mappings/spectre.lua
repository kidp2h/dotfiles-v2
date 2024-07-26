local map = require('utils.api').map
map("n", "<M-g>", "<cmd>Spectre<CR>", "Spectre")
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre")
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word")
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word")
map('v', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file")
