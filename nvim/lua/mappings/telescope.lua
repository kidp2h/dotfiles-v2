local map = require("utils.api").map
map("n", "<M-p>", "<cmd>Telescope projects<CR>", "Projects")
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", "Find files")
map("n", "<M-l>", "<cmd>Telescope live_grep<CR>", "Live grep")
map("n", "<M-f>", "<cmd>Telescope oldfiles<CR>", "Recent files")
