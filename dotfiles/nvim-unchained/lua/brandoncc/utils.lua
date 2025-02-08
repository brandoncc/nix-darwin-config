local M = {}

local gemfile_lock_name = "Gemfile.lock"

function M.file_contains_text(file_name, text)
  -- vim returns 0 for false, but that is truthy in lua
  if not M.repo_root_contains_file(file_name) then
    return false
  end

  local matching_line_count_string = vim.fn.system("cat " .. file_name .. " | grep '" .. text .. "' | wc -l")
  local converted_ok, matching_line_count = pcall(tonumber, matching_line_count_string)

  return converted_ok and matching_line_count >= 1
end

function M.gemfile_lock_contains(text)
  return M.file_contains_text(gemfile_lock_name, text)
end

function M.repo_root_contains_file(file_name)
  local file_path = vim.fn.getcwd() .. "/" .. file_name

  return vim.fn.filereadable(file_path) == 1
end

-----------------------------------------------------------
-- Function equivalent to basename in POSIX systems.
-- @param str the path string.
-----------------------------------------------------------
function M.basename(str)
  return string.gsub(str, "(.*/)(.*)", "%2")
end

-----------------------------------------------------------
-- Contatenates given paths with correct separator.
-- @param: var args of string paths to joon.
-----------------------------------------------------------
function M.join_paths(...)
  local path_sep = "/"
  local result = table.concat({ ... }, path_sep)
  return result
end

local _base_lua_path = M.join_paths(vim.fn.stdpath("config"), "lua")
local _hyphen_safe_base_path = _base_lua_path:gsub("%-", "%%-")

-----------------------------------------------------------
-- Loads all modules from the given package.
-- @param package: name of the package in lua folder.
-----------------------------------------------------------
function M.glob_require(package)
  local glob_path = M.join_paths(_base_lua_path, package, "**", "*.lua")
  for _, path in pairs(vim.split(vim.fn.glob(glob_path), "\n")) do
    -- convert absolute filename to relative
    -- ~/.config/nvim/lua/<package>/<module>.lua => <package>/foo

    local relfilename = path:gsub(_hyphen_safe_base_path, ""):gsub("^%/", ""):gsub(".lua$", "")
    local basename = M.basename(relfilename)

    -- skip `init` and files starting with underscore.
    if #relfilename > 0 and basename ~= "init" and basename:sub(1, 1) ~= "_" then
      require(relfilename)
    end
  end
end

function M.escape_lua_pattern(pattern)
  local matches = {
    ["^"] = "%^",
    ["$"] = "%$",
    ["("] = "%(",
    [")"] = "%)",
    ["%"] = "%%",
    ["."] = "%.",
    ["["] = "%[",
    ["]"] = "%]",
    ["*"] = "%*",
    ["+"] = "%+",
    ["-"] = "%-",
    ["?"] = "%?",
  }

  return pattern:gsub(".", matches)
end

return M
