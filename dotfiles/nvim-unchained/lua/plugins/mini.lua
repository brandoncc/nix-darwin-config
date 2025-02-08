return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  config = function()
    require("brandoncc.mini")
  end,
}
