lvim.autocommands = {
  {
    "BufEnter",                                                                              -- see `:h autocmd-events`
    {                                                                                        -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { '*.html', '*.tsx', "*.ts", "*.css", "*.scss", "*.sass", "*.jsx", "*.js" }, -- see `:h autocmd-events`
      command = "ColorizerAttachToBuffer",                                                   -- see `:h autocmd-events`
    }
  },
}
