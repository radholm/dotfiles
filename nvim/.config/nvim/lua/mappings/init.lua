local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('surround').setup { mappings_style = 'surround' }
require('nvim_comment').setup {}

vim.g.mapleader = ' '

map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fr', '<cmd>Telescope resume<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
map('n', '<leader>b', '<cmd>Telescope file_browser<CR>', opts)
map('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", opts)

map('n', '<leader>ng', '<cmd>Neogit<CR>', opts)
map('n', '<leader>gg', '<cmd>LazyGit<CR>', opts)

map('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", {})
map('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", {})
map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", {})
map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", {})

map('', 's', "<cmd>HopWord<CR>", {})

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>re', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<leader>x', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>X', vim.diagnostic.goto_prev, bufopts)
end

require('lspconfig').tsserver.setup {
    on_attach = on_attach
}
require('lspconfig').jsonls.setup {
    on_attach = on_attach
}
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    }
}
require('lspconfig').cssls.setup {
    on_attach = on_attach
}
-- require('lspconfig')['null-ls'].setup {
--     on_attach = on_attach
-- }
require('lspconfig').eslint.setup {
    bin = 'eslint_d', -- or `eslint_d`
    code_actions = {
        enable = true,
        apply_on_save = {
            enable = true,
            types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
        },
        disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
        },
    },
    diagnostics = {
        enable = true,
        report_unused_disable_directives = false,
        run_on = "type", -- or `save`
    },
}
require('lspconfig').dockerls.setup {}
require('lspconfig').html.setup {}
require('lspconfig').bashls.setup {}
require('lspconfig').yamlls.setup {}
