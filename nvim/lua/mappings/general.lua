local map = require("utils.api").map

map("n", "<leader>w", ":w<cr>", "Save File")
map("n", "<C-a>", "ggVG", "Select All")
map("n", "q", "<Nop>", "Disable Ex mode")

map("n", "<F2>", ":CloseOthers<cr>", "Finder")
map("n", "<C-g>", ":Far<cr>", "Find and replace")
map("i", "<C-g>", ":Far<cr>", "Find and replace")
map("n", "<F12>", function()
	if vim.g.background == "dark" then
		require("config.highlighting").setup("latte", "light")
		os.execute("kitty +kitten themes --reload-in=all Catppuccin-Latte")
	else
		require("config.highlighting").setup("mocha", "dark")

		os.execute("kitty +kitten themes --reload-in=all Catppuccin-Mocha")
	end
end, "Toggle theme dark/light")
