local wezterm = require('wezterm')

local config = wezterm.config_builder()
local act = wezterm.action

-- setup
config.default_prog = { '/usr/bin/fish', '-l' }
config.audible_bell = "Disabled"
config.scrollback_lines = 9999
-- appearance
config.cursor_blink_rate = 0
local my_theme = wezterm.color.get_builtin_schemes()['catppuccin-macchiato']
my_theme.background = '#212529'
config.color_schemes = {
  ['my_theme'] = my_theme,
}
config.color_scheme = "my_theme"
config.window_decorations = "NONE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.font = wezterm.font_with_fallback {
  "Consolas Nerd Font",
  "Noto Color Emoji",
  "Source Han Serif CN",
}
config.font_size = 13
config.line_height = 0.9
-- config.freetype_load_flags = 'DEFAULT'
config.freetype_load_target = 'Light'
-- config.freetype_render_target = 'HorizontalLcd'
config.default_cursor_style = 'SteadyBar'
config.adjust_window_size_when_changing_font_size = false
config.tab_and_split_indices_are_zero_based = false
config.window_background_opacity = 1
config.inactive_pane_hsb = {
  brightness = 0.7,
}
-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- keybinds
config.disable_default_key_bindings = true
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    mods = "LEADER",
    key = "c",
    action = act.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "LEADER",
    key = "x",
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    mods = "CTRL|ALT",
    key = "w",
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    mods = "LEADER",
    key = "b",
    action = act.ActivateTabRelative(-1),
  },
  {
    mods = "LEADER",
    key = "n",
    action = act.ActivateTabRelative(1),
  },
  {
    mods = "LEADER",
    key = "t",
    action = act.ShowTabNavigator,
  },
  {
    mods = "ALT",
    key = "-",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    mods = "ALT",
    key = "=",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    mods = "ALT",
    key = "h",
    action = act.ActivatePaneDirection "Left",
  },
  {
    mods = "ALT",
    key = "l",
    action = act.ActivatePaneDirection "Right",
  },
  {
    mods = "ALT",
    key = "j",
    action = act.ActivatePaneDirection "Down",
  },
  {
    mods = "ALT",
    key = "k",
    action = act.ActivatePaneDirection "Up",
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = act.AdjustPaneSize { "Left", 5 },
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = act.AdjustPaneSize { "Right", 5 },
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = act.AdjustPaneSize { "Down", 5 },
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = act.AdjustPaneSize { "Up", 5 },
  },
  {
    mods = "CTRL|SHIFT",
    key = "v",
    action = act.PasteFrom 'Clipboard',
  },
  {
    mods = "SHIFT",
    key = "Insert",
    action = act.PasteFrom 'Clipboard',
  },
  {
    mods = "LEADER",
    key = "k",
    action = act.CloseCurrentTab { confirm = false },
  },
  {
    mods = "LEADER",
    key = "[",
    action = act.ActivateCopyMode,
  },
  {
    mods = "CTRL|SHIFT",
    key = "c",
    action = act.CopyTo 'Clipboard',
  },
  {
    mods = 'CTRL|SHIFT',
    key = 'u',
    action = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' }
  },
  {
    mods = "LEADER",
    key = "p",
    action = act.PasteFrom 'Clipboard',
  },
  {
    mods = "CTRL|ALT",
    key = "l",
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    mods = "CTRL|ALT",
    key = "j",
    action = act.ScrollByPage(1),
  },
  {
    mods = "CTRL|ALT",
    key = "k",
    action = act.ScrollByPage(-1),
  },
  {
    mods = "CTRL|ALT",
    key = "l",
    action = act.ScrollToBottom,
  },
  {
    mods = "CTRL|ALT",
    key = "h",
    action = act.ScrollToTop,
  },
  {
    mods = "NONE",
    key = "PageDown",
    action = act.ScrollByPage(1),
  },
  {
    mods = "NONE",
    key = "PageUp",
    action = act.ScrollByPage(-1),
  },
  {
    mods = "CTRL|SHIFT",
    key = "f",
    action = act.Search { CaseInSensitiveString = "" },
  }
}

for i = 1, 9 do
  table.insert(config.keys, {
    mods = "ALT",
    key = tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

return config
