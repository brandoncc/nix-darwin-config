return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "≃" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Navigate to next hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Navigate to previous hunk" })

        -- Actions
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Show [H]unk [b]lame" })
        map("n", "<leader>lb", gitsigns.toggle_current_line_blame, { desc = "Toggle [L]ine [b]lame" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~1")
        end, { desc = "[H]unk [d]iff against the last commit" })
        map("n", "<leader>hd", function()
          gitsigns.diffthis("~")
        end, { desc = "[H]unk [d]iff against the index" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select [i]nside [h]unk" })
      end,
    })
  end,
}
