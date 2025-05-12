local wezterm = require('wezterm')

local config = wezterm.config_builder()
local act = wezterm.action

-- setup
config.default_prog = { 'pwsh' }
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
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.harfbuzz_features = {
  'calt=0', 'clig=0', 'liga=0'
}
config.freetype_load_flags = 'NO_HINTING'
config.font = wezterm.font_with_fallback {
  "IosevkaZeng Nerd Font",
  "LXGW Wenkai",
  "Noto Color Emoji",
}
-- config.underline_position = -2
config.font_size = 13
config.line_height = 1
config.default_cursor_style = 'SteadyBar'
config.adjust_window_size_when_changing_font_size = false
config.tab_and_split_indices_are_zero_based = false
config.window_background_opacity = 1
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.8,
}
config.selection_word_boundary = " \t\n{}[]()\"'`.,;:/\\="
-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
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
    mods = "CTRL|SHIFT",
    key = "t",
    action = act.SpawnTab "CurrentPaneDomain",
  },
  {
    mods = "CTRL",
    key = "Tab",
    action = act.ActivateLastTab,
  },
  {
    mods = "LEADER",
    key = "x",
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    mods = "LEADER",
    key = "k",
    action = act.CloseCurrentTab { confirm = false },
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
    mods = "LEADER",
    key = ",",
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    mods = "ALT",
    key = "-",
    action = act.SplitVertical,
  },
  {
    mods = "ALT",
    key = "=",
    action = act.SplitHorizontal,
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
    mods = "ALT",
    key = "LeftArrow",
    action = act.AdjustPaneSize { "Left", 5 },
  },
  {
    mods = "ALT",
    key = "RightArrow",
    action = act.AdjustPaneSize { "Right", 5 },
  },
  {
    mods = "ALT",
    key = "DownArrow",
    action = act.AdjustPaneSize { "Down", 5 },
  },
  {
    mods = "ALT",
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
    mods = "CTRL|SHIFT",
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
    action = act.Search { CaseInSensitiveString = '' },
  }
}

for i = 1, 9 do
  table.insert(config.keys, {
    mods = "ALT",
    key = tostring(i),
    action = act.ActivateTab(i - 1),
  })
end

config.mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event={Up={streak=1, button="Left"}},
    mods="NONE",
    action=act.CompleteSelection("PrimarySelection"),
  },

  -- and make CTRL-Click open hyperlinks
  {
    event={Up={streak=1, button="Left"}},
    mods="CTRL",
    action=act.OpenLinkAtMouseCursor,
  },

  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.Nop,
  }
}

return config
