return {
  "williamboman/mason.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local path = require("mason-core.path")
    local devenv_state_dir = ".devenv/state"
    local find_root = require("lspconfig.util").root_pattern(devenv_state_dir)
    local cwd = vim.loop.cwd()
    local root_dir = find_root(cwd)
    local custom_settings = {}

    if root_dir then
      custom_settings.install_root_dir = path.concat({ root_dir, devenv_state_dir, ".mason" })
    end

    require("mason").setup(custom_settings)
  end,
}
