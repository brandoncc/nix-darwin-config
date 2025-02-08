local is_loaded, mini_indentscope = pcall(require, "mini.indentscope")
if not is_loaded then
  return
end

mini_indentscope.setup({
  options = {
    -- use actual text indentation, rather than the cursor column
    indent_at_cursor = false,
  },
})
