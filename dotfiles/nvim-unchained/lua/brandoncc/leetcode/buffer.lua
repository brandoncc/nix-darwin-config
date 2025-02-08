local helpers = require("brandoncc.leetcode.helpers")

M = {}

local default_commands = {
  run = ":Leet run<CR>",
  submit = ":Leet submit<CR>",
  switch_language = ":Leet lang<CR>",
}

local languange_commands = {}

local function commands_for_current_language()
  local ft = vim.bo.filetype
  return languange_commands[ft] or {}
end

local function map_bindings()
  local commands = vim.tbl_extend("force", {}, default_commands, commands_for_current_language())

  vim.keymap.set("n", "<leader><leader>ll", commands.switch_language, { desc = "Switch language", buffer = 0 })
  vim.keymap.set("n", "<leader><leader>lr", commands.run, { desc = "Run exercise", buffer = 0 })
  vim.keymap.set("n", "<leader><leader>ls", commands.submit, { desc = "Submit exercise", buffer = 0 })

  print("mapped leetcode bindings")
end

local function disable_copilot()
  local ok, _ = pcall(cmd, "Copilot disable")

  if ok then
    print("Copilot disabled")
  end
end

local function annotate_buffer_as_configured()
  vim.api.nvim_buf_set_var(0, "leetcode_configured", true)
end

local function is_buffer_configured()
  local ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "leetcode_configured")
  return ok
end

local function setup()
  if not is_buffer_configured() then
    -- do this first or configuration still might be called more than once if using a `FileType` autocmd
    annotate_buffer_as_configured()
    map_bindings()
    disable_copilot()
  end
end

return {
  setup = setup,
}
