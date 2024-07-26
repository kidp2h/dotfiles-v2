return {
  "themaxmarchuk/tailwindcss-colors.nvim",
  -- run the setup function after plugin is loaded
  config = function()
    -- pass config options here (or nothing to use defaults)
    require("tailwindcss-colors").setup()

    lvim.lsp.on_attach_callback = function(client, bufnr)
      local ft = vim.bo.filetype
      if (ft == "typescriptreact" or ft == "javascriptreact") then
        require("tailwindcss-colors").buf_attach(bufnr)
      end
    end
  end
}
