return {
  "vim-test/vim-test",
  cmd = { -- lazy load upon use
    "TestFile",
    "TestNearest",
    "TestFile",
    "TestSuite",
    "TestLast",
    "TestVisit",
  },
  dependencies = {
    "brandoncc/vim-test-lua-plenary",
  },
  keys = {
    { "<leader>tn", "<cmd>TestNearest<CR>", { desc = "[T]ests: Run [n]earest" } },
    { "<leader>tf", "<cmd>TestFile<CR>", { desc = "[T]ests: Run all tests in [f]ile" } },
    { "<leader>ts", "<cmd>TestSuite<CR>", { desc = "[T]ests: Run full test [s]uite" } },
    { "<leader>tl", "<cmd>TestLast<CR>", { desc = "[T]ests: Rerun [l]ast test" } },
    { "<leader>tg", "<cmd>TestVisit<CR>", { desc = "[T]ests: Visit the file containing the most recently run test" } },
  },
  config = function()
    if os.getenv("TMUX") then
      vim.cmd('let test#strategy = "dispatch"')
    else
      vim.cmd('let test#strategy = "neovim"')
    end

    vim.cmd('let test#custom_runners = {"Lua": ["Plenary"]}')

    vim.cmd('let test#lua#runner = "plenary"')

    -- If bin/rails is available, use it
    vim.cmd("let g:test#ruby#use_binstubs = 1")
    -- otherwise, use `bundle exec rails`
    vim.cmd("let g:test#ruby#bundle_exec = 1")
  end,
}
