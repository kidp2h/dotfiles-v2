local map = require("utils.api").map

map("n", "<F3>", function()
	require("jester").run_file()
end, "Run test current file")
