local wezterm = require("wezterm")
local config = {}

-- If you are using a newer version of WezTerm, use config builder:
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.disable_default_key_bindings = true

-- Change your font face and size here
config.font = wezterm.font("AnnotationM Nerd Font Mono")
config.font_size = 14.0

return config
