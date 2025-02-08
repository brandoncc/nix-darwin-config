local map_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

return {
  "brandoncc/butler.nvim",
  dependencies = { "brandoncc/processes.nvim" },
  event = "VimEnter",
  init = function()
    local butler_loaded_ok, butler = pcall(require, "butler")
    if not butler_loaded_ok then
      return
    end

    butler.setup({
      log_kill_signals = true,
      interface = "tmux",
    })

    -- Make sure we kill all butler processes on exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        require("butler").stop()
      end,
    })

    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end

    which_key.add({
      { "<leader>b", group = "[B]utler", nowait = true, remap = false },
      { "<leader>b_", hidden = true, nowait = true, remap = false },
      {
        "<leader>bp",
        '<Cmd>lua require("butler").processes()<CR>',
        desc = "[B]utler - View [p]rocesses",
        nowait = true,
        remap = false,
      },
      {
        "<leader>br",
        '<Cmd>lua require("butler").restart()<CR>',
        desc = "[B]utler - [R]estart processes",
        nowait = true,
        remap = false,
      },
      {
        "<leader>bs",
        '<Cmd>lua require("butler").stop()<CR>',
        desc = "[B]utler - [S]top processes",
        nowait = true,
        remap = false,
      },
    })
  end,
}
