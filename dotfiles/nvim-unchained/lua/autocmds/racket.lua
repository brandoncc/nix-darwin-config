local M = {}

function M.attach()
  local lc_ok, lspconfig = pcall(require, "lspconfig")

  if not lc_ok then
    print("lspconfig wasn't found, couldn't load racket_langserver")
  end

  lspconfig.racket_langserver.setup({})
end

return M
