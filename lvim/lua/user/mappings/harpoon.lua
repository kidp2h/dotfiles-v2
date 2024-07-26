lvim.keys.normal_mode["<S-h>"] = function()
	require("harpoon.mark").add_file()
	vim.notify("Added this file", "info", {
		title = "[Harpoon]",
	})
end
lvim.keys.normal_mode["<leader>h"] = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>"
