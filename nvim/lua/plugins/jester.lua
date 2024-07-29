return {
	"David-Kunz/jester",
	config = function()
		require("jester").setup({
			identifiers = { "test", "it", "spec" },
			dap = {
				console = "externalTerminal",
			},
		})
	end,
}
