local is_loaded, mini_diff = pcall(require, "mini.diff")
if not is_loaded then
  return
end

mini_diff.setup()

vim.keymap.set("n", "<leader>td", mini_diff.toggle_overlay, { desc = "[T]oggle unstage[d] changes overlay" })
