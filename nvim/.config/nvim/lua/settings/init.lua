local set = vim.opt

set.guicursor = ''

vim.cmd('command! W write')
vim.cmd('command! Wq write | quit')
vim.cmd('command! WQ write | quit')
vim.cmd('command! Q quit')

set.cmdwinheight = 1
set.wildmode = {'list', 'longest'}

set.exrc = true
set.nu = true
set.errorbells = false
set.updatetime = 50
set.laststatus = 0
set.cmdheight = 0
set.autoread = true
set.signcolumn = 'no'
set.nuw = 1

set.mouse = 'nv'

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.smartindent = true
set.autoindent = true
set.tabstop = 2
set.softtabstop = 2

set.swapfile = false
set.backup = false
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = false
set.splitright = true
set.wrap = false
set.fileencoding = 'utf-8'
set.termguicolors = true

set.relativenumber = true
set.cursorline = false
set.scrolloff = 8
set.sidescrolloff = 8

set.hidden = true
set.clipboard = 'unnamedplus'
