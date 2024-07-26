return {
  on_attach = function(_, bufnr)
    require("tailwindcss-colors").buf_attach(bufnr)
  end,
  root_dir = function(fname)
    local util = require "lspconfig/util"
    return util.root_pattern(
      "tailwind.config.js",
      "tailwind.config.ts",
      "tailwind.config.cjs",
      "tailwind.js",
      "tailwind.ts",
      "tailwind.cjs"
    )(fname)
  end,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          "tw\\.style\\(([^)]*)\\)",
          "tw=\"([^\"]*)",
          "tw={\"([^\"}]*)",
          "tw\\.\\w+`([^`]*)",
          "tw\\(.*?\\)`([^`]*)"
        }
      },
      classAttributes = {
        "class",
        "className",
        "ngClass",
        "style"
      }
    }
  }
}
