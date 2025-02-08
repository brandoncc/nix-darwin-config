local helpers = require("brandoncc.exercism.helpers")

M = {}

local map_opts = {
  mode = "n",
  prefix = "<leader><leader>",
  buffer = 0,
  silent = false,
  noremap = true,
  nowait = true,
}

local default_commands = {
  run_tests = ":!exercism test<CR>",
  submit = ":!exercism submit %<CR>",
}

local languange_commands = {
  c = {
    run_tests = ":!make test<CR>",
    submit = ":!exercism submit %<.h %<CR>",
  },
  clojure = {
    run_tests = ":!lein test<CR>",
  },
  elixir = {
    run_tests = ":!mix test<CR>",
  },
  go = {
    run_tests = ":!go test -v --bench . --benchmem<CR>",
  },
  ocaml = {
    run_tests = ":!make<CR>",
  },
  python = {
    run_tests = ":!python3 -m pytest -o markers=task *_test.py<CR>",
  },
  rust = {
    run_tests = ":!cargo test<CR>",
  },
  scala = {
    run_tests = ":!sbt test<CR>",
  },
}

local function commands_for_current_language()
  local ft = vim.bo.filetype
  return languange_commands[ft] or {}
end

local function map_bindings()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local commands = vim.tbl_extend("force", {}, default_commands, commands_for_current_language())

  local mappings = {
    t = { commands.run_tests, "Run exercism tests" },
    s = { commands.submit, "Submit exercism exercise" },
  }

  print("mapped exercism bindings")
  which_key.register(mappings, map_opts)
end

local function disable_copilot()
  local cmd = vim.cmd
  local ok, _ = pcall(vim.cmd, "Copilot disable")

  if ok then
    print("Copilot disabled")
  end
end

local function annotate_buffer_as_configured()
  vim.api.nvim_buf_set_var(0, "exercism_configured", true)
end

local function is_buffer_configured()
  local ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "exercism_configured")
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
