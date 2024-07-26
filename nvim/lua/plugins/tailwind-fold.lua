return {
	"razak17/tailwind-fold.nvim",
	opts = {
		symbol = "󱏿 ",
		highlight = {
			fg = "#38BDF8",
		},
		min_chars = 10,
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
}
