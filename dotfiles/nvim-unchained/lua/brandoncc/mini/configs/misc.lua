local is_loaded, mini_misc = pcall(require, "mini.misc")
if not is_loaded then
  return
end

mini_misc.setup({
  make_global = { "put", "put_text" },
})
