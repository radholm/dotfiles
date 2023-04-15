require('packer-config')
require('lsp-config')
require('settings')
require('mappings')
require('colorschemes-config.dosbox')
require('telescope-config')
require('treesitter-config')
require('vcs-config')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- require('rose-pine').setup({
--     disable_background = true
-- })

-- vim.api.nvim_exec('language en_US', true)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_exec('hi Normal guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi EndOfBuffer guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi StatusLine guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi SpecialKey guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi LineNr guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi Folded guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi NonText guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi VertSplit guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi SignColumn guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi Telescope guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeBorder guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeNormal guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeMatching guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopePromptNormal guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeTitle guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopePromptPrefix guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeSelection guibg=none ctermbg=none', true)
-- vim.api.nvim_exec('hi TelescopeSelectionCaret guibg=none ctermbg=none', true)
