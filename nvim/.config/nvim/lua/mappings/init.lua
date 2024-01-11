vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", ":", "q:i")
-- vim.keymap.set("n", "<leader>w", "q:i")
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "]]zz")
-- vim.keymap.set("n", "<C-u>", "[[zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format)

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('surround').setup { mappings_style = 'surround' }
require('nvim_comment').setup {}

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fr', '<cmd>Telescope resume<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader><leader>', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
map('n', '<leader>b', '<cmd>Telescope file_browser<CR>', opts)
map('n', '<leader>fu', '<cmd>Telescope lsp_references<CR>', opts)
map('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", opts)
map('n', '<leader>fmg', ":lua require('telescope.builtin').live_grep({cwd = '/home/radhofre/.dev/lf/meta-csw/'})<CR>", opts)
-- map('n', '<leader>fmg', "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)

map('n', '<leader>gg', '<cmd>G<CR>', opts)

-- map('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<CR>", {})
-- map('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<CR>", {})
-- map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<CR>", {})
-- map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<CR>", {})

map('', 'f', "<cmd>HopWord<CR>", {})
map('', '<leader>ni', "<cmd>AsyncRun npm install<CR><cmd>copen<CR>", {})
map('', '<leader>nr', "<cmd>AsyncRun nrd<CR><cmd>copen<CR>", {})
