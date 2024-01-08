require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "build", ".git", "package-lock.json", "*.vsd*" },
    find_command = {
      'rg',
      '-L',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u'
    },
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    results_title = "";
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    mappings = {
      i = {}
    }
  },
  pickers = {
    find_files = {
      hidden = true
    }  
  },
  extensions_list = { "fzf" },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        ["i"] = {},
        ["n"] = {},
      },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  }
}
