-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 124
config.initial_rows = 32

-- or, changing the font size and color scheme.
config.font_size = 21
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.colors = {
	background = "#1f1f28",
}
config.window_background_gradient = {
	colors = { "#000000" },
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	{ key = "LeftArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },

	{ key = "x", mods = "LEADER", action = act.ActivateCopyMode },

	-- zellij tmux-mode parity
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.ActivatePaneDirection("Next") },
	{ key = ",", mods = "LEADER", action = act.PromptInputLine({
		description = "Rename tab:",
		action = wezterm.action_callback(function(window, _, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	}) },
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },

	{ key = "Enter", mods = "SHIFT", action = act.SendString("\x1b[13;2u") },
}

return config
