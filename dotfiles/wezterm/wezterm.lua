-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Blue Matrix"

config.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font Mono",
})

config.font_size = 18.0

-- required for nix install of wezterm to render properly
config.front_end = "WebGpu"

-- and finally, return the configuration to wezterm
return config
