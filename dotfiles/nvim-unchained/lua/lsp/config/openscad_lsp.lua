return function(opts)
  local has_lspconfig, lspconfig = pcall(require, "lspconfig")

  if not has_lspconfig then
    error("lspconfig is not available")
  end

  local config = vim.tbl_deep_extend("force", {}, lspconfig.openscad_lsp.config_def.default_config)
  table.insert(config.cmd, "--fmt-style")
  table.insert(config.cmd, "file")

  return config
end
