local api = vim.api

local buf_enter_all = vim.api.nvim_create_augroup("buf-enter-all", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = buf_enter_all,
  callback = function(event)
    require("autocmds.buf_enter_all").attach(event.buf)
  end,
})

local filetype_based_autocmds = vim.api.nvim_create_augroup("filetype-based-autocmds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = filetype_based_autocmds,
  callback = function(event)
    local ft = vim.bo.filetype
    local ok, required = pcall(require, "autocmds." .. ft)

    if ok then
      required.attach(event.buf)
    end
  end,
})

local function keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }

  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local seeing_is_believing_group = api.nvim_create_augroup("SeeingIsBelievingSettings", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = seeing_is_believing_group,
  pattern = "ruby",
  callback = function()
    keymap("n", "<Enter>", "<Plug>(seeing-is-believing-mark-and-run)", "Mark line, then run seeing-is-believing")
    keymap("x", "<Enter>", "<Plug>(seeing-is-believing-mark-and-run)", "Mark line, then run seeing-is-believing")
    keymap("n", "<F4>", "<Plug>(seeing-is-believing-mark)", "Mark line for seeing-is-believing")
    keymap("x", "<F4>", "<Plug>(seeing-is-believing-mark)", "Mark line for seeing-is-believing")
    keymap("i", "<F4>", "<Plug>(seeing-is-believing-mark)", "Mark line for seeing-is-believing")
    keymap("n", "<F5>", "<Plug>(seeing-is-believing-run)", "Run seeing-is-believing")
    keymap("i", "<F5>", "<Plug>(seeing-is-believing-run)", "Run seeing-is-believing")
  end,
})

local hover_diagnostics_group = api.nvim_create_augroup("hover-diagnostics", { clear = true })

api.nvim_create_autocmd("CursorHold", {
  group = hover_diagnostics_group,
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
  end,
})
