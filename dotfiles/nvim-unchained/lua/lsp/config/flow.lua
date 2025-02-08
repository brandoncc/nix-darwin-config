return function()
  local opts = {}

  opts.cmd = { "npx", "--no-install", "--package=flow-bin", "flow", "lsp" }

  return opts
end
