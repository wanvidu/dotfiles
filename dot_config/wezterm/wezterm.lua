-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14

config.window_decorations = "RESIZE"

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then 
	config.default_prog = { 'pwsh.exe' }
end

-- and finally, return the configuration to wezterm
return config