## For Nvidia Prime
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

## load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

## change cursor from X to ptr cursor
xsetroot -cursor_name left_ptr &

## required for dunst
systemctl --user import-environment DISPLAY XAUTHORITY
if command -v dbus-update-activation-environment > /dev/null 2>&1 ; then
	dbus-update-activation-environment DISPLAY XAUTHORITY
fi

## disable annoying beeps
xset b off &

## start bspwm
exec bspwm

