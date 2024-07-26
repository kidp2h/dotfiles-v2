return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		require("lsp_signature").setup({

			doc_lines = 0,
			floating_window = false,
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "none",
			},

			hi_parameter = "LspSignatureActiveParameter",
			hint_enable = true, -- virtual hint enable
			hint_prefix = "🔥 ",
			hint_inline = function()
				return "right_align"
			end,
		})
	end,
}
