-- https://wezfurlong.org/wezterm/config/lua/general.html
-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.hide_mouse_cursor_when_typing = false
config.adjust_window_size_when_changing_font_size = false
config.font = wezterm.font("Hack Nerd Font Mono")
config.color_scheme = "Vs Code Dark+ (Gogh)"
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.font_size = 16
config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = false
config.exit_behavior = "CloseOnCleanExit"
config.cursor_blink_rate = 0
-- config.window_background_opacity = 0.95
config.initial_rows = 30
config.initial_cols = 80
config.line_height = 1.05
config.colors = {
	cursor_fg = "black",
}

-- and finally, return the configuration to wezterm
return config
