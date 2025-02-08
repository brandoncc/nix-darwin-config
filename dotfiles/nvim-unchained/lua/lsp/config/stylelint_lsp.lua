return function(opts)
  local modified_opts = opts or {}

  modified_opts.filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "sugarss",
    "typescript",
    "typescriptreact",
    "vue",
    "wxss",
  }

  return modified_opts
end
