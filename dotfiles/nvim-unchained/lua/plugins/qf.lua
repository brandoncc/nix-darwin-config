return {
  "romainl/vim-qf",
  event = "VimEnter",
  init = function()
    vim.g.qf_mapping_ack_style = 1
    vim.g.qf_max_height = 15
  end,
  config = function()
    -- vim.g.qf_mapping_ack_style = 1
    -- vim.cmd('let g:qf_max_height = 15')
    vim.keymap.set("n", "<Home>", "<Plug>(qf_qf_previous)", { desc = "Go to next quickfix item" })
    vim.keymap.set("n", "<End>", "<Plug>(qf_qf_next)", { desc = "Go to previous quickfix item" })

    vim.keymap.set("n", "<C-k>", "<Plug>(qf_qf_previous)", { desc = "Go to next quickfix item" })
    vim.keymap.set("n", "<C-j>", "<Plug>(qf_qf_next)", { desc = "Go to previous quickfix item" })

    vim.keymap.set("n", "<C-Home>", "<Plug>(qf_loc_previous)", { desc = "Go to next location list item" })
    vim.keymap.set("n", "<C-End>", "<Plug>(qf_loc_next)", { desc = "Go to previous location list item" })

    vim.keymap.set("n", "<C-q>", "<Plug>(qf_qf_toggle)", { desc = "Toggle quickfix list" })

    vim.keymap.set("n", "<Left>", "<Plug>(qf_older)", { desc = "Go to the previous quickfix list" })
    vim.keymap.set("n", "<Right>", "<Plug>(qf_newer)", { desc = "Go to the next quickfix list" })
  end,
}
