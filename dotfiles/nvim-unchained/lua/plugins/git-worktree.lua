local function init()
  local function map_bindings()
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end

    which_key.add({
      { "<leader>gw", group = "Worktree", nowait = true, remap = false },
      {
        "<leader>gwc",
        '<Cmd>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>',
        desc = "Create a worktree",
        nowait = true,
        remap = false,
      },
      {
        "<leader>gws",
        '<Cmd>lua require("brandoncc.worktree.utils").setup_worktree_dependencies_for_current_path()<CR>',
        desc = "Setup current worktree dependencies",
        nowait = true,
        remap = false,
      },
      {
        "<leader>gww",
        '<Cmd>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>',
        desc = "Choose a worktree",
        nowait = true,
        remap = false,
      },
    })
  end

  map_bindings()

  require("telescope").load_extension("git_worktree")

  local worktree_utils = require("brandoncc.worktree.utils")
  local Worktree = require("git-worktree")

  Worktree.setup({
    confirm_telescope_deletions = true,
  })

  -- op = Operations.Switch, Operations.Create, Operations.Delete
  -- metadata = table of useful values (structure dependent on op)
  --      Switch
  --          path = path you switched to
  --          prev_path = previous worktree path
  --      Create
  --          path = path where worktree created
  --          branch = branch name
  --          upstream = upstream remote name
  --      Delete
  --          path = path where worktree deleted

  vim.g.git_worktree_log_level = "info"

  Worktree.on_tree_change(worktree_utils.on_tree_change)
end

return {
  "brandoncc/git-worktree.nvim",
  branch = "catch-and-handle-telescope-related-error",
  dependencies = { "nvim-telescope/telescope.nvim", "folke/which-key.nvim" },
  init = init,
  opts = {
    confirm_telescope_deletions = false,
  },
  event = "VimEnter",
}
