local utils = require("brandoncc.utils")

local function client_has_name(client, name)
  return client.name == name
end

local function disable_diagnostics_for_lsp_client(client)
  local ns = vim.lsp.diagnostic.get_namespace(client.id)
  vim.diagnostic.disable(nil, ns)
end

local function disable_formatting_for_lsp_client(client)
  client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
end

local function repo_has_flow_config()
  return utils.repo_root_contains_file(".flowconfig")
end

local function repo_has_typescript_config()
  return utils.repo_root_contains_file("tsconfig.json") or utils.repo_root_contains_file("jsconfig.json")
end

local function special_setup_for_tsserver(client)
  if not client_has_name(client, "tsserver") then
    return
  end

  if repo_has_flow_config() and not repo_has_typescript_config() then
    disable_diagnostics_for_lsp_client(client)
    disable_formatting_for_lsp_client(client)
  end
end

local function special_setup_for_clangd(client)
  if not client_has_name(client, "clangd") then
    return
  end

  -- Fixes this error when completing exercism challenges:
  --   https://github.com/neovim/nvim-lspconfig/issues/2184#issuecomment-1511154286
  --   https://github.com/LazyVim/LazyVim/issues/198
  client.offset_encoding = "utf-16"
end

-- add to the global LSP on_attach function
return function(client, _bufnr)
  special_setup_for_tsserver(client)
  special_setup_for_clangd(client)
end
