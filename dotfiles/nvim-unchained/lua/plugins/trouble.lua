return {
  "folke/trouble.nvim",
  event = "BufEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/which-key.nvim" },
  config = function()
    require("trouble").setup()

    vim.keymap.set("n", "<leader>xx", function()
      require("trouble").toggle()
    end, { desc = "Toggle trouble panel" })
    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, { desc = "Workspace diagnostics" })
    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, { desc = "Document diagnostics" })
    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, { desc = "Quickfix" })
    vim.keymap.set("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, { desc = "Loclist" })
    vim.keymap.set("n", "gR", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "LSP references using Trouble" })

    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end

    which_key.add({
      { "<leader>x", group = "Trouble diagnostics", nowait = true, remap = false },
      { "<leader>x_", hidden = true, nowait = true, remap = false },
    })
  end,
}
