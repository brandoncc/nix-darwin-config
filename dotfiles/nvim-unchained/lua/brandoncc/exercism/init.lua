local helpers = require("brandoncc.exercism.helpers")

local augroup = vim.api.nvim_create_augroup("exercism-workspace", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.*",
  group = augroup,
  callback = function()
    if not helpers.is_exercism_file() then
      return
    end

    require("brandoncc.exercism.buffer").setup()
  end,
})
