local M = {}

function M.attach(bufnr)
  vim.keymap.set("v", "<leader><Bslash>", ":EasyAlign*<Bar><CR>",
    { desc = "Align markdown table", buffer = bufnr, noremap = true, nowait = true })
end

return M
