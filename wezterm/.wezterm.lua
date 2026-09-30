local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

-- Set your preferred font family and size
config.font = wezterm.font("AnnotationM Nerd Font Mono")
config.font_size = 12.0
config.enable_wayland = false
config.audible_bell = "Disabled"

config.visual_bell = {
	fade_in_duration_ms = 0,
	fade_out_duration_ms = 0,
}

-- Remove the default title bar while keeping window resizing edges
-- config.window_decorations = "RESIZE"

-- OR remove all decorations completely (no resize handles/borders on some platforms)
config.window_decorations = "NONE"
config.enable_tab_bar = false

return config
