local map = require("utils.api").map

map("n", "gh", ":Lspsaga finder<cr>", "Finder")
map("n", "gd", ":Lspsaga peek_definition<cr>", "Preview Definition")
map("n", "gD", ":Lspsaga goto_definition<cr>", "Goto Definition")
map("n", "gt", ":Lspsaga peek_type_definition<cr>", "Preview Type Definition")
map("n", "gT", ":Lspsaga goto_type_definition<cr>", "Goto Type Definition")
map("n", "bd", ":Lspsaga show_buf_diagnostics<cr>", "Show buffer diagnostic")
map("n", "K", ":Lspsaga hover_doc<cr>", "Documentation")
map("n", "<M-r>", ":Lspsaga rename<cr>", "Rename")
map("n", "<M-o>", ":Lspsaga outline<cr>", "Outline")
map("n", "<M-a>", ":Lspsaga code_action<cr>", "Code action")
map("n", "<leader>[", ":Lspsaga diagnostic_jump_prev<CR>", "Next diagnostic")
map("n", "<leader>]", ":Lspsaga diagnostic_jump_next<CR>", "Previous diagnostic")
