lvim.transparent_window = false
lvim.use_icons = true
lvim.termguicolors = true
-- lvim.format_on_save.enabled = true

vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"
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
opt.foldlevelstart = 99
opt.foldlevel = 10
opt.foldenable = true
opt.fillchars = [[eob: ,vert: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "0"
opt.laststatus = 2
opt.cmdheight = 0
opt.pumheight = 10
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
opt.guifont = { "GeistMono Nerd Font", ":h12" }
vim.g.editorconfig = true
vim.opt.background = "light"
vim.diagnostic.config({ virtual_text = false })
lvim.colorscheme = 'github_light'



if vim.g.neovide then
  if (lvim.transparent_window) then
    vim.g.neovide_transparency = 0.9
  end
  vim.g.neovide_window_blurred = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_length = 0.1
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.15
  vim.g.neovide_cursor_vfx_particle_density = 15
  vim.g.neovide_cursor_vfx_particle_speed = 10
end
