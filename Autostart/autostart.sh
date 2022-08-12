##Kill if already running
killall -9 xfsettingsd picom polybar mpd dunst ksuperkey xfce4-power-manager

## Restore Wallpaper
nitrogen --restore

##xfce4-settings daemon
xfsettingsd &

##polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
  /usr/lib/xfce-polkit/xfce-polkit &
 fi
 
##Enable power management
xfce4-power-manager &

##Start Compositing Manager
exec picom &

##Launch Polybar
bash ~/.config/openbox/polybar/launch.sh

##Notificaton Daemon
exec dunst &

##Start Music Player Daemon
exec mpd &

##Thunar Daemon
exec thunar --daemon &

##Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &
