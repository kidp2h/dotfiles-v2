local opt = vim.opt
-- Options
opt.clipboard = "unnamedplus"
opt.splitkeep = "screen"
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
vim.o.foldlevelstart = 99
vim.o.foldlevel = 10
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,vert: ,fold: ,foldopen: ,foldsep: ,foldclose: ]]
vim.o.foldcolumn = "0"
opt.laststatus = 3
opt.cmdheight = 0
opt.pumheight = 10
opt.scroll = 8
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
-- vim.o.guifont = "MonoLisa Nerd Font:h12:r"
vim.g.editorconfig = true

if vim.g.neovide then
	vim.g.neovide_window_blurred = false
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_smooth_blink = true
	vim.g.neovide_no_idle = true

	vim.g.neovide_transparency = 1
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 30
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 100
	vim.g.neovide_cursor_antialiasing = false

	vim.g.neovide_cursor_vfx_particle_lifetime = 0
	vim.g.neovide_cursor_vfx_mode = "ripple"
	vim.g.neovide_cursor_vfx_particle_density = 15
	vim.g.neovide_cursor_vfx_particle_speed = 10
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_trail_length = 0

	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
end
local methods = vim.lsp.protocol.Methods
local inlay_hint_handler = vim.lsp.handlers[methods["textDocument_inlayHint"]]
