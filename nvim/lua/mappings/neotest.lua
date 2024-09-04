local map = require("utils.api").map

map(
	"n",
	"<leader>tw",
	"<cmd>lua require('neotest').run.run({ jestCommand = 'pnpm jest --watch ' })<cr>",
	"Run test in watch mode"
)
