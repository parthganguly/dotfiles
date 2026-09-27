-- Hyprland 0.55+ Lua configuration. The previous hyprland.conf is retained
-- as a fallback while this migration is checked on the desktop.
local mod = "SUPER"
local terminal = "alacritty"
local menu = "rofi -show drun"

hl.config({
    input = {
        kb_layout = "us",
        sensitivity = -0.3,
        accel_profile = "fla",
        touchpad = {
            natural_scroll = true,
            drag_lock = false,
            disable_while_typing = true,
            scroll_factor = 0.8,
            tap_to_click = true,
            clickfinger_behavior = true,
        },
    },
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = "rgba(c8cdd2ff)",
            inactive_border = "rgba(3b4048ff)",
        },
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        blur = {
            enabled = false,
            size = 4,
            passes = 2,
            new_optimizations = true,
        },
        shadow = {
            enabled = false,
            range = 18,
            render_power = 3,
            color = "rgba(00000099)",
        },
    },
    animations = {
        enabled = false,
    },
})

hl.window_rule({ match = { class = "Thunar" }, opacity = "0.55 0.55" })
hl.window_rule({ match = { class = "^(tauonmb)$" }, opacity = "0.88 0.82" })

-- These run only when the Hyprland session starts, including after a login.
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar >/tmp/waybar.log 2>&1")
    hl.exec_cmd("xfsettingsd")
    hl.exec_cmd("~/Scripts/mount-gdrive.sh")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("/home/parth/.local/bin/set-wallpaper")
    hl.exec_cmd("eww daemon")
    hl.exec_cmd('sh -c "sleep 1 && eww open witcher"')
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("sleep 1 && awww img /home/parth/Pictures/Wallpapers/witcher-mac.png")
end)

hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("/home/parth/.local/bin/set-wallpaper"))
hl.bind(mod .. " + W", hl.dsp.exec_cmd("eww open --toggle witcher"))
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("/home/parth/.local/bin/powermenu"))
hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("Thunar"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("/home/parth/Applications/helium.AppImage"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + Space", hl.dsp.window.float())
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("brightnessctl --device='smc::kbd_backlight' set +10%"))
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd("brightnessctl --device='smc::kbd_backlight' set 10%-"))

local directions = {
    left = "left",
    right = "right",
    up = "up",
    down = "down",
}
for key, direction in pairs(directions) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = direction }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

local resize = {
    left = { -40, 0 },
    right = { 40, 0 },
    up = { 0, -40 },
    down = { 0, 40 },
}
for key, delta in pairs(resize) do
    hl.bind(mod .. " + CTRL + " .. key, hl.dsp.window.resize({
        x = delta[1],
        y = delta[2],
        relative = true,
    }))
end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + H", hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
hl.bind(mod .. " + Tab", hl.dsp.workspace.toggle_special("minimized"))

for workspace = 1, 9 do
    hl.bind(mod .. " + " .. workspace, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mod .. " + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace }))
end
hl.bind(mod .. " + ALT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + ALT + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("/home/parth/.local/bin/smart-lock"))
