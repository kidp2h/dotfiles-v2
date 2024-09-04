local pure = require("utils.commons").pure
local plugin = require("utils.commons").plugin
return {
	pure("nvim-tree/nvim-web-devicons"),
	plugin("lspkind"),
	plugin("lspconfig"),
	pure("williamboman/nvim-lsp-installer"),
	pure("tpope/vim-surround"),

	pure("hrsh7th/cmp-nvim-lsp"),

	pure("hrsh7th/cmp-buffer"),
	pure("hrsh7th/cmp-path"),
	pure("hrsh7th/cmp-cmdline"),
	pure("hrsh7th/cmp-nvim-lsp-signature-help"),
	pure("hrsh7th/cmp-nvim-lua"),
	pure("hrsh7th/cmp-calc"),
	pure("ray-x/cmp-treesitter"),
	pure("lukas-reineke/cmp-rg"),
	pure("FelipeLema/cmp-async-path"),
	pure("hrsh7th/cmp-emoji"),

	plugin("cmp"),

	plugin("luasnip"),
	pure("saadparwaiz1/cmp_luasnip"),
	plugin("toggleterm"),
	plugin("bufferline"),
	plugin("mason"),
	plugin("neo-tree"),
	plugin("lualine"),
	plugin("alpha"),
	plugin("lspsaga"),
	plugin("project"),
	plugin("telescope"),
	plugin("noice"),
	plugin("tailwind-cmp"),
	plugin("tailwind-fold"),
	plugin("tailwind-colors"),
	plugin("endhints"),
	plugin("none-ls"),
	plugin("ufo"),
	plugin("tiny-inline-diagnostic"),
	plugin("trouble"),
	plugin("edgy"),
	plugin("flash"),
	plugin("copilot").copilot,
	plugin("copilot").chat,
	plugin("copilot_cmp"),
	plugin("colorizer"),
	plugin("harpoon"),
	plugin("gitsigns"),
	plugin("discord"),
	plugin("conform"),
	plugin("spectre"),
	plugin("window"),
	plugin("visual-multi"),
	plugin("numb"),
	plugin("context"),
	plugin("autotag"),
	plugin("mini-icons"),
	plugin("indent-blankline"),
	plugin("illuminate"),
	plugin("autopairs"),
	plugin("comment"),
	plugin("smart-splits"),
	plugin("dressing"),
	plugin("todo"),
	-- plugin("rainbow-delimiters"),
	plugin("treesitter"),
	plugin("statuscol"),
	plugin("twilight"),
	plugin("tailwind-sorter"),
	-- plugin("markview"),
	plugin("symbol-usage"),
	plugin("lsp-timeout"),
	plugin("codeium"),
	plugin("jester"),
	plugin("cmp-under-comparator"),
	plugin("nvim-lint"),
	plugin("schemastore"),
	plugin("dropbar"),
	plugin("incline"),
	plugin("diffview"),
	plugin("neogit"),
	plugin("fugit2"),
	plugin("gh-actions"),
	plugin("octo"),
	-- plugin("precognition"),
	plugin("neotest"),
	plugin("ts-tools"),
	plugin("render-markdown"),
	plugin("ollama"),
	pure("wakatime/vim-wakatime", false),
}
