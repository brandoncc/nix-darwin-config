M = {}

M.is_exercism_file = function()
  local buffer_file_path = vim.api.nvim_buf_get_name(0)
  return buffer_file_path:find(vim.env.HOME .. '/Exercism/')
end

return M
