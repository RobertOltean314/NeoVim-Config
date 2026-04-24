-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- indentation
vim.opt.tabstop = 5
vim.opt.shiftwidth = 2
vim.opt.expandtab = true       -- use spaces instead of tabs
vim.opt.autoindent = true      -- you already have this
vim.opt.textwidth = 80
vim.opt.formatoptions:append("t")

-- search
vim.opt.ignorecase = true      -- case insensitive search
vim.opt.smartcase = true       -- unless you type uppercase

-- appearance
vim.opt.cursorline = true      
vim.opt.colorcolumn = '80'     
vim.opt.termguicolors = true   -- enables full color support
vim.opt.scrolloff = 8          -- keeps 8 lines above/below cursor

-- behavior
vim.opt.wrap = false           -- no line wrapping
vim.opt.swapfile = false       -- no swap files
vim.opt.backup = false         -- no backup files
vim.opt.undofile = true        -- persistent undo history
vim.opt.splitright = true      -- vertical splits open on the right
vim.opt.splitbelow = true      -- horizontal splits open below

vim.g.mapleader = ' '         
