-- Remove binding
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.lsp.buffer_mappings.normal_mode['gd'] = nil
lvim.lsp.buffer_mappings.normal_mode['gD'] = nil
-- Remap binding
lvim.keys.normal_mode["gh"] = "<cmd>Lspsaga finder<CR>"
lvim.keys.normal_mode["gd"] = "<cmd>Lspsaga peek_definition<CR>"
lvim.keys.normal_mode["gt"] = "<cmd>Lspsaga peek_type_definition<CR>"
lvim.keys.normal_mode["gD"] = "<cmd>Lspsaga goto_definition<CR>"
lvim.keys.normal_mode["gT"] = "<cmd>Lspsaga goto_type_definition<CR>"
lvim.keys.normal_mode["K"] = "<cmd>Lspsaga hover_doc<CR>"
lvim.keys.normal_mode["<leader>a"] = "<cmd>Lspsaga code_action<CR>"
lvim.keys.normal_mode["<leader>["] = "<cmd>Lspsaga diagnostic_jump_prev<CR>"
lvim.keys.normal_mode["<leader>]"] = "<cmd>Lspsaga diagnostic_jump_next<CR>"
