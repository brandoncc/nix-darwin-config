local utils = require("brandoncc.utils")
local ruby_lsp_gemfile_lock_search_string = "^    ruby-lsp "

return function()
  local opts = {}

  opts.root_dir = require("lspconfig.util").root_pattern("Gemfile") or require("lspconfig.util").find_git_ancestor

  if utils.gemfile_lock_contains(ruby_lsp_gemfile_lock_search_string) then
    opts.cmd = { "bundle", "exec", "ruby-lsp" }
  end

  -- for some reason this isn't set automatically after I upgraded to neovim 0.10.0 and updated my plugins
  opts.filetypes = { "ruby" }

  return opts
end
