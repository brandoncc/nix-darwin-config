local is_loaded, mini_jump = pcall(require, "mini.jump")
if not is_loaded then
  return
end

mini_jump.setup()
