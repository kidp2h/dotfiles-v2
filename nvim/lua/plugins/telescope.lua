local icons = require("config.icons")
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {

        selection_caret = " ",
        entry_prefix = " ",
        layout_strategy = "horizontal",
        initial_mode = "insert",
        color_devicons = true,
        prompt_prefix = "   ",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        file_ignore_patterns = { "node_modules", "*.lock", "package.json" },
        path_display = { "smart" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.9,
          height = 0.80,
          preview_cutoff = 120,
        },
        selection_strategy = "reset",
        sorting_strategy = 'ascending',
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        winblend = 0,
        border = {},
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
        grep_string = {
          only_sort_text = true,
        },
        buffers = {
          initial_mode = "normal",
        },
        planets = {
          show_pluto = true,
          show_moon = true,
        },
        git_files = {
          hidden = true,
          show_untracked = true,
        },
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
      },
    }

    pcall(function()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('projects')
    end)
  end,
}
