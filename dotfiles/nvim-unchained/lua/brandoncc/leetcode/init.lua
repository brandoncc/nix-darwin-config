local helpers = require("brandoncc.leetcode.helpers")

local augroup = vim.api.nvim_create_augroup("leetcode-workspace", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.*",
  group = augroup,
  callback = function()
    if not helpers.is_leetcode_file() then
      return
    end

    require("brandoncc.leetcode.buffer").setup()
  end,
})
