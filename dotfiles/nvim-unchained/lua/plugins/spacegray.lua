return {
  "vim-scripts/Spacegray.vim",
  event = "VimEnter",
  name = "spacegray",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme spacegray")

    -- These values make the foreground and background match what I had in AstroNvim
    vim.cmd("highlight Normal ctermfg=250 ctermbg=233 guifg=#b3b8c4 guibg=#141617")

    -- Make comments brighter
    vim.cmd("highlight Comment cterm=italic ctermfg=59 gui=italic guifg=#aaaaaa")
  end,
}
