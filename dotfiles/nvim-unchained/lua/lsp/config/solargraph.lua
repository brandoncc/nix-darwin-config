local utils = require("brandoncc.utils")
local solagraph_gemfile_lock_search_string = "^    solargraph "
local sorbet_gemfile_lock_search_string = "^    sorbet-runtime "

return function()
  local opts = {}

  if utils.gemfile_lock_contains(solagraph_gemfile_lock_search_string) then
    opts.cmd = { "bundle", "exec", "solargraph", "stdio" }
  end

  opts.root_dir = require("lspconfig.util").find_git_ancestor

  if utils.gemfile_lock_contains(sorbet_gemfile_lock_search_string) then
    opts.enabled = false
  end

  return opts
end
