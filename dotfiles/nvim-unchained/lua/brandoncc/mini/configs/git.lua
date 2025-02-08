local is_loaded, mini_git = pcall(require, "mini.git")
if not is_loaded then
  return
end

mini_git.setup({})

vim.keymap.set(
  "n",
  "<leader>g?",
  mini_git.show_at_cursor,
  { desc = "[G]it: Show at [c]ursor (commit, diff, or range history)" }
)
