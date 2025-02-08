return {
  "nvim-telescope/telescope.nvim",
  init = function()
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("live_grep_args")
    require("telescope").load_extension("fzf")
  end,
  event = "VimEnter",
  keys = {
    { "<leader>.", "<cmd>lua require'telescope.builtin'.find_files()<CR>" },
    { "<leader>/", "<cmd>lua require'telescope.builtin'.builtin()<CR>" },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-file-browser.nvim",
      keys = {
        { "<leader>,", "<cmd>Telescope file_browser path=%:p:h<CR>" },
      },
    },
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      keys = {
        {
          "<leader>fw",
          "<cmd>lua require'telescope'.extensions.live_grep_args.live_grep_args()<CR>",
          "Project-wide grep",
        },
      },
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable("make") == 1,
      build = "make",
    },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")
    local lga_actions = require("telescope-live-grep-args.actions")

    -- https://neovim.io/doc/user/lua.html#vim.tbl_extend()
    -- "force" keeps the right-most values
    return vim.tbl_deep_extend("force", opts, {
      -- defaults copied from astronvim in order to provide the feel I'm used to
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {
            -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
          hidden = true,
          additional_args = function(_)
            return {
              -- search files that are in ignored by git
              "--unrestricted",
              -- follow symlinks
              "--follow",
              -- don't search logs
              "--glob",
              "!log",
              -- don't search node modules
              "--glob",
              "!node_modules",
              -- don't search tmp directory
              "--glob",
              "!tmp",
              -- don't search .git directory
              "--glob",
              "!.git",
            }
          end,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = {
            "rg",
            "--files",
            -- search files that are in ignored by git
            "--unrestricted",
            -- follow symlinks
            "--follow",
            -- don't search logs
            "--glob",
            "!log",
            -- don't search node modules
            "--glob",
            "!node_modules",
            -- don't search tmp directory
            "--glob",
            "!tmp",
            -- don't search .git directory
            "--glob",
            "!.git",
            -- don't search .devenv directory
            "--glob",
            "!.devenv",
          },
        },
        live_grep = {
          hidden = true,
          additional_args = function(_)
            return {
              -- search files that are in ignored by git
              "--unrestricted",
              -- follow symlinks
              "--follow",
              -- don't search logs
              "--glob",
              "!log",
              -- don't search node modules
              "--glob",
              "!node_modules",
              -- don't search tmp directory
              "--glob",
              "!tmp",
              -- don't search .git directory
              "--glob",
              "!.git",
              -- don't search .devenv directory
              "--glob",
              "!.devenv",
            }
          end,
        },
        buffers = {
          path_display = { "smart" },
        },
      },
    })
  end,
}
