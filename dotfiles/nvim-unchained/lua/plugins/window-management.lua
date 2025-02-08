return {
  "brandoncc/window-management.nvim",
  event = "VimEnter",
  config = function()
    local window_management = require("window-management")

    vim.keymap.set("n", "<C-w>m", window_management.tall_left,
      { noremap = true, silent = true, desc = "Apply tall-left layout" })
  end
}
