local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

g.vim_version = vim.version().minor
g.nvchad_theme = config.ui.theme
g.toggle_theme_icon = "   "
g.transparency = 90
g.theme_switcher_loaded = false

-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if g.vim_version < 8 then
  g.did_load_filetypes = 0
  g.do_filetype_lua = 1
end

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.relativenumber = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 0
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = -1

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 200

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

g.mapleader = ","

-- disable some builtin vim plugins
local default_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_plugins) do
  g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
