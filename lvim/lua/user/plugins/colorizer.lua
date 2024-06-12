return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({})
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',     -- optional
    'nvim-tree/nvim-web-devicons',         -- optional
  }
}
