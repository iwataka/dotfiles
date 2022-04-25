local wezterm = require 'wezterm';

local module = {
  font = wezterm.font("Hack Nerd Font Mono"),
  window_background_opacity = 0.9,
  color_scheme = "Gruvbox Dark",
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  local wsl_domains = wezterm.default_wsl_domains()
  if #wsl_domains > 0 then
    module.default_domain = wsl_domains[1].name
  end
end

return module
