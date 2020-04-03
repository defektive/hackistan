mkdir -p $HOME/.local/share/sdf
systemctl --user import-environment DISPLAY &

# picom &
start-pulseaudio-x11 &

feh --randomize --bg-tile $HOME/.config/wallpaper/repeatable/dark/* &
sxhkd -c ~/.config/sxhkd/* &
sdf_polybar &
exec bspwm
