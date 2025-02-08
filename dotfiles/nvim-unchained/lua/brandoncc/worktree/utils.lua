local null_ls_utils_loaded, null_ls_utils = pcall(require, "brandoncc.null-ls.utils")
local Worktree = require("git-worktree")
local terminal = require("brandoncc.terminal")

local path_is_absolute = function(path)
  return path:sub(1, 1) == "/"
end

-- This is a global variable that we use to determine if the most recent callback run was a Create or a Switch.
local last_callback_type_run = nil

local function common_git_directory()
  return vim.fn.system("git rev-parse --git-common-dir"):gsub("\n", "")
end

local function get_shared_directory_path()
  local path = (common_git_directory() .. "/shared")
  return path
end

local function get_shared_file_list(shared_directory_path)
  local all_files = vim.fn.system("find " .. shared_directory_path .. " -type f")

  local files = {}

  for file in all_files:gmatch("[^\n]+") do
    if file:len() > 0 then
      table.insert(files, file)
    end
  end

  return files
end

local function add_tool_installer_commands(t)
  table.insert(t, {
    signal_file = ".tool-versions",
    cmd = "asdf install",
    message = "ASDF config detected, installing versions",
  })

  table.insert(t, {
    signal_file = "yarn.lock",
    cmd = "yarn",
    message = "Yarn detected, running yarn install",
  })

  table.insert(t, {
    signal_file = "package-lock.json",
    cmd = "npm i",
    message = "NPM detected, running npm install",
  })

  table.insert(t, {
    signal_file = "Gemfile.lock",
    cmd = "bundle",
    message = "Bundler detected, running bundle install",
  })
end

-- Dynamically build a list of commands we should run to set the worktree up. This list is based on the files that
-- exist in the shared directory.
local function on_create_commands(worktree_path)
  local shared_directory_path = get_shared_directory_path()
  local shared_files = get_shared_file_list(shared_directory_path)

  local commands = {}

  for _, file_path in ipairs(shared_files) do
    -- Adding two because of 1-based indexing
    --   - file_path:sub(file_path:len()) returns the last character of file_path, rather than an empty string
    --   - we also want to remove the forward slash after the directory name
    local file_path_without_shared_directory = file_path:sub(shared_directory_path:len() + 2)
    local target_path = worktree_path .. "/" .. file_path_without_shared_directory

    local expanded_source_code = "ruby -e 'puts File.expand_path(\"" .. file_path:gsub("'", "\\'") .. "\")'"
    local expanded_target_code = "ruby -e 'puts File.expand_path(\"" .. target_path:gsub("'", "\\'") .. "\")'"

    local expanded_source_path = vim.fn.system(expanded_source_code):gsub("\n", "")
    local expanded_target_path = vim.fn.system(expanded_target_code):gsub("\n", "")

    local expanded_target_directory = vim.fn.system("dirname " .. expanded_target_path):gsub("\n", "")

    table.insert(commands, {
      signal_file = expanded_source_path,
      cmd = 'mkdir -p "'
        .. expanded_target_directory
        .. '" && ln -s "'
        .. expanded_source_path
        .. '" "'
        .. expanded_target_path
        .. '"',
      message = "Symlinking " .. expanded_source_path .. " to " .. expanded_target_path,
    })
  end

  add_tool_installer_commands(commands)

  return commands
end

local function setup_worktree_dependencies(worktree_path)
  local commands_to_run = {}

  for _, command in ipairs(on_create_commands(worktree_path)) do
    local file_path = path_is_absolute(command.signal_file) and command.signal_file
      or worktree_path .. "/" .. command.signal_file

    if vim.fn.filereadable(file_path) == 1 then
      table.insert(commands_to_run, command.cmd)
    end
  end

  -- Update the vim working directory to the new worktree
  vim.cmd("cd " .. worktree_path)

  if #commands_to_run > 0 then
    terminal.run_commands(commands_to_run)
  end
end

local function setup_worktree_dependencies_for_current_path()
  setup_worktree_dependencies(vim.fn.getcwd())
end

local function on_create(metadata)
  local worktree_path = Worktree.get_root() .. "/" .. metadata.path

  setup_worktree_dependencies(worktree_path)
end

local function on_switch(_)
  if last_callback_type_run ~= Worktree.Operations.Create then
    -- .tmux.conf has a special key binding that uses @default-path for new
    -- windows if it exists.
    if #vim.fn.system("printenv TMUX") > 0 then
      vim.fn.system('tmux attach-session -c "' .. vim.fn.getcwd() .. '"')
    end

    require("butler").restart()

    -- Close all buffers then open netrw in the current worktree
    vim.fn.execute(":%bd | Exp " .. vim.fn.getcwd())
  end

  if null_ls_utils_loaded then
    null_ls_utils.refresh_sources()
  end
end

local function on_tree_change(op, metadata)
  if op == Worktree.Operations.Switch then
    on_switch(metadata)
  end

  if op == Worktree.Operations.Create then
    on_create(metadata)
  end

  -- After creation, Switch callback is run. It is useful to know what the most recent callback type was.
  last_callback_type_run = op
end

return {
  on_tree_change = on_tree_change,
  setup_worktree_dependencies_for_current_path = setup_worktree_dependencies_for_current_path,
}
