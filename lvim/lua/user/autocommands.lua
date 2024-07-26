local fn = require("user.utils.fn")
fn.create_auto_cmd("BufEnter", {
	pattern = { "*.html", "*.tsx", "*.ts", "*.css", "*.scss", "*.sass", "*.jsx", "*.js", "*.lua" },
	command = "ColorizerAttachToBuffer",
})

fn.create_auto_cmd("BufWritePost", {
	pattern = { "*.html", "*.tsx", "*.ts", "*.css", "*.scss", "*.sass", "*.jsx", "*.js", "*.lua" },
	command = "ColorizerAttachToBuffer",
})
