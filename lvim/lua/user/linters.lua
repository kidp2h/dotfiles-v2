local linters = require "lvim.lsp.null-ls.linters"
local null_ls = require('null-ls')
linters.setup {
  {
    command = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  }
}
