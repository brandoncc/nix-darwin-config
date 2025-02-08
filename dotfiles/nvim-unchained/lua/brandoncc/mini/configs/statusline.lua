local statusline = require("mini.statusline")
statusline.setup()

-- set cursor information to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return "%2l:%-2v"
end

-- display attached LSP server names
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_lsp = function(args)
  local lsp_servers = {}

  for _, client in ipairs(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) do
    table.insert(lsp_servers, client.name)
  end

  if #lsp_servers > 0 then
    return "󰰎 "
      .. #lsp_servers
      .. " "
      .. table.concat(
        vim.tbl_map(function(server)
          return server:sub(1, 1)
        end, lsp_servers),
        ","
      )
  else
    return ""
  end
end
