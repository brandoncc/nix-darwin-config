-- config has to be set before loading the plugin
vim.g.easy_log_map_key = ",el"
vim.g.easy_log_upper_configuration_map = ",eL"
vim.g.easy_log_type_map_key = ",etl"
vim.g.easy_log_type_upper_map_key = ",etL"

vim.g.easy_log_log_map = {
  bash = { 'echo "', ": $", '"' },
  ruby = { 'puts "', ": #{", '}"' },
  lua = { 'print("', ':", ', ")" },
  javascriptreact = { 'console.log("', '", ', ")" },
  typescriptreact = { 'console.log("', '", ', ")" },
  eruby = { 'console.log("', '", ', ")" },
  rust = { 'println!("', ': {:?}", ', ");" },
  zsh = { 'echo "', ": $", '"' },
  go = { 'fmt.Printf("', ' %+v\\n", ', ")" },
}

vim.g.easy_log_type_map = {
  ruby = { 'puts "', '.class: " + ', ".class.to_s" },
  lua = { 'print("type(', '):", type(', "))" },
  javascriptreact = { 'console.log("', ': ", Object.prototype.toString.call(', "))" },
  typescriptreact = { 'console.log("', ': ", Object.prototype.toString.call(', "))" },
  eruby = { 'console.log("', ': ", Object.prototype.toString.call(', "))" },
}

return { "brandoncc/vim-easylog", event = "BufEnter" }
