return {
  { "tpope/vim-abolish", event = "VimEnter" },
  {
    "tpope/vim-dispatch",
    event = "VimEnter",
    init = function()
      -- Fix the arrow keys in dispatch, otherwise they output control codes
      -- ref: https://github.com/tpope/vim-dispatch/issues/118
      vim.g.dispatch_tmux_pipe_pane = 1
    end,
  },
  { "tpope/vim-eunuch", event = "VimEnter" },
  { "tpope/vim-fugitive", event = "VimEnter", dependencies = { "tpope/vim-rhubarb" } },
  { "tpope/vim-rails", event = "BufEnter" },
  { "tpope/vim-repeat", event = "BufEnter" },
  { "tpope/vim-surround", event = "BufEnter" },
}
