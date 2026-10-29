local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local ok, local_config = pcall(require, "local_config")

if not ok then
	local_config = {}
end

config.font_size = local_config.font_size or 14

config.font = wezterm.font("AnnotationM Nerd Font Mono")
config.enable_wayland = false
config.audible_bell = "Disabled"
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

config.visual_bell = {
	fade_in_duration_ms = 0,
	fade_out_duration_ms = 0,
}

config.window_decorations = "NONE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.95

config.disable_default_key_bindings = true
config.keys = {
	-- Fullscreen
	{
		key = "Enter",
		mods = "SUPER",
		action = wezterm.action.ToggleFullScreen,
	},

	-- Copy
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},

	-- Paste
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	-- Font size
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "0",
		mods = "CTRL",
		action = wezterm.action.ResetFontSize,
	},
}

config.mouse_bindings = {
	-- Drag window with Alt + left click
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "ALT",
		action = wezterm.action.StartWindowDrag,
	},
}

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
