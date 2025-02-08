local exercism_helpers = require("brandoncc.exercism.helpers")

local M = {}

local function configure_building_and_running()
  -- Set the makeprg for C files, so that `:make` will build the current file and execute the new binary
  -- The execution part of this is broken at the moment, but it was working
  vim.cmd("setlocal makeprg=gcc\\ %\\ -o\\ %<\\ &&\\ ./%<")
end

function M.attach(_bufnr)
  if not exercism_helpers.is_exercism_file() then
    configure_building_and_running()
  end
end

return M
