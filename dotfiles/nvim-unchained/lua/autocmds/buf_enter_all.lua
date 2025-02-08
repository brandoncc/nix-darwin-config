local M = {}

-- Ruby indentation is often incorrect when opening new files or when restoring the last session. Reloading
-- editorconfig fixes the issue.
local function reload_editorconfig()
  if vim.fn.exists(":EditorConfigReload") ~= 0 then
    vim.cmd(":EditorConfigReload")
  end
end

function M.attach(_bufnr)
  reload_editorconfig()
end

return M
