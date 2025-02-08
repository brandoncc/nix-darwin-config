return function(opts)
  local has_lspconfig, lspconfig = pcall(require, "lspconfig")

  if not has_lspconfig then
    error("lspconfig is not available")
  end

  local default_config = lspconfig.sorbet.config_def.default_config
  local custom_config = {
    root_dir = require("lspconfig.util").root_pattern("sorbet/config"),
  }

  return vim.tbl_deep_extend("force", default_config, custom_config)
end
