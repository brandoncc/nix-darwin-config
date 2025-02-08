local M = {}

function M.attach()
  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    ",a",
    ":exe 'e ' . rails#buffer().alternate()<CR>",
    { noremap = true, silent = true, desc = "Edit rails alternate file" }
  )
end

return M
