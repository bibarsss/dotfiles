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

return config
