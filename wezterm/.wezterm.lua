local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'tokyonight_storm'

config.leader = { key="a", mods="CTRL" }
config.keys = {
  { key = "%", mods = "LEADER|SHIFT", action=act{SplitHorizontal={domain="CurrentPaneDomain"}} },
  { key = "|", mods = "LEADER|SHIFT", action=act{SplitVertical={domain="CurrentPaneDomain"}} },
  { key = "[", mods = "LEADER", action=act.ActivateCopyMode},
  { key = "z", mods = "LEADER", action="TogglePaneZoomState" },
  { key = "c", mods = "LEADER", action=act{SpawnTab="CurrentPaneDomain"}},
  { key = "a", mods = "LEADER|CTRL", action= act.SendKey { key = "a", mods = "CTRL" }},
  { key = "l", mods = "ALT", action = act.ShowLauncher },
  { key = "s", mods = "LEADER", action = act.ShowLauncherArgs{flags="FUZZY|WORKSPACES"}},
  { key = "f", mods = "LEADER", action = act.SpawnCommandInNewTab {
    args = { wezterm.home_dir .. '/bin/sessionizer'},
  }},
  { key = 'LeftArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CTRL",
    action = act.ActivateTab(i - 1),
  })
end

config.ssh_domains = wezterm.default_ssh_domains()
for _, dom in ipairs(config.ssh_domains) do
  dom.assume_shell = 'Posix'
end

return config
