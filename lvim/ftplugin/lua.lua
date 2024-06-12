local opts = {
  settings = {
    Lua = { hint = { enable = true } },
  },
}
require("lvim.lsp.manager").setup("sumneko_lua", opts)
