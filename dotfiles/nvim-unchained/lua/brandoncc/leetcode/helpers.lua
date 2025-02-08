local utils = require("brandoncc.utils")

M = {}

M.is_leetcode_file = function()
  local buffer_file_path = vim.api.nvim_buf_get_name(0)
  local leetcode_challenge_path = vim.fn.stdpath("data") .. "/leetcode/"
  local escaped_pattern = utils.escape_lua_pattern(leetcode_challenge_path)

  return buffer_file_path:find(escaped_pattern)
end

return M
