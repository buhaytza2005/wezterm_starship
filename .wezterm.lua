-- Pull in the wezterm API
local wezterm = require 'wezterm'
local action = wezterm.action


-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {
	font = wezterm.font {
		family = 'Cascadia Code NF',
		weight = 'Medium',
	},

	automatically_reload_config = true,
	color_scheme = 'Dracula',
	default_prog = {'pwsh.exe'},
	tab_bar_at_bottom = true,
	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 },
	-- disable_default_key_bindings = true,
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultAssignment,

		},
		{
			key = "c",
			mods = "LEADER",
			action = action.SpawnTab "CurrentPaneDomain",
		},
		{
			key = "-",
			mods = "LEADER",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		{
			key = "%",
			mods = "LEADER|SHIFT",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "1",
			mods = "LEADER",
			action = action.ActivateTab(0),
		},
		{
			key = "2",
			mods = "LEADER",
			action = action.ActivateTab(1),
		},
		{
			key = "3",
			mods = "LEADER",
			action = action.ActivateTab(2),
		},
		{
			key = "4",
			mods = "LEADER",
			action = action.ActivateTab(3),
		},
		{
			key = "5",
			mods = "LEADER",
			action = action.ActivateTab(4),
		},
	}



}

-- and finally, return the configuration to wezterm
return config
