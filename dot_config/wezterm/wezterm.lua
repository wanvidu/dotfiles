-- Activate copy mode 	Ctrl + Shift + X
-- Copy and exit copy mode 	y
-- Exit copy mode 	Esc
-- Cell selection 	v
-- Line selection 	Shift + V
-- Rectangular selection 	Ctrl + V

local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 15

config.window_decorations = "RESIZE"

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "ubuntu.exe" }
end

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe" },
	})

	table.insert(launch_menu, {
		label = "Ubuntu",
		args = { "ubuntu.exe" },
	})
end

config.launch_menu = launch_menu

-- config.color_scheme = "Adventure"

config.colors = {
	foreground = "#34AB2A",
	background = "#000000",

	cursor_bg = "#CFCFCF",
	cursor_fg = "#CFCFCF",
	cursor_border = "#CFCFCF",

	selection_fg = "#00A48C",
	selection_bg = "#00A48C",

	scrollbar_thumb = "#969696",

	split = "#969696",

	ansi = {
		"#000000",
		"#9F0000",
		"#008B00",
		"#FFD000",
		"#0081FF",
		"#BC00CA",
		"#008B8B",
		"#969696",
	},

	brights = {
		"#555555",
		"#FF0000",
		"#00EE00",
		"#FFFF00",
		"#0A5DFF",
		"#FF00FF",
		"#00CDCD",
		"#CCCCCC",
	},
}

config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.2,
	brightness = 1.5,
}

config.keys = {
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 3, button = "Left" } },
		action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
		mods = "NONE",
	},
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

return config
