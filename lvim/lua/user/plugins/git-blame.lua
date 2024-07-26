return {
	"f-person/git-blame.nvim",
	config = function()
		require("gitblame").setup({
			enabled = false,
			highlight_group = "@comment.todo",
			message_when_not_committed = "Don't forget commit your changes!",
		})
	end,
}
