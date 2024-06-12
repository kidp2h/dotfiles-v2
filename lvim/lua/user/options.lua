lvim.transparent_window = true
lvim.use_icons = true
lvim.termguicolors = true
lvim.format_on_save.enabled = true
local opt = vim.opt
-- Options
opt.relativenumber = true
opt.number = true
opt.swapfile = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = true
opt.numberwidth = 2
opt.smarttab = true
opt.fileencoding = "utf-8"
opt.termguicolors = true
opt.smartcase = true
opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.foldenable = true
opt.laststatus = 2
opt.cmdheight = 0
opt.pumheight = 10
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
opt.guifont = { "MonoLisa Nerd Font:h15" }
vim.g.editorconfig = true

lvim.colorscheme = 'dracula'

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { '*.json', '*.lua', '*.tsx', '*.ts', '*.js', 'jsx', '*.css', '*.scss', '*.less', '*.sass', '*.jsonc', '*.html' },
  command = "ColorizerAttachToBuffer",
})
