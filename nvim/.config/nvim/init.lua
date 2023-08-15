require('packer-config')
require('lsp-config')
require('lint-config')
require('settings')
require('mappings')
require('colorschemes-config.dosbox')
require('telescope-config')
require('treesitter-config')
require('vcs-config')

local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#000000',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  gray   = '#333333',
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { 
    a = { fg = colors.gray, bg = colors.black },
    b = { fg = colors.gray, bg = colors.black },
    c = { fg = colors.gray, bg = colors.black },
  },
  visual = { 
    a = { fg = colors.gray, bg = colors.black },
    b = { fg = colors.gray, bg = colors.black },
    c = { fg = colors.gray, bg = colors.black },
  },
  replace = { 
    a = { fg = colors.gray, bg = colors.black },
    b = { fg = colors.gray, bg = colors.black },
    c = { fg = colors.gray, bg = colors.black },
  },

  inactive = {
    a = { fg = colors.gray, bg = colors.black },
    b = { fg = colors.gray, bg = colors.black },
    c = { fg = colors.gray, bg = colors.black },
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '|', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename', 'progress'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

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
