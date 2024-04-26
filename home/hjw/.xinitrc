if xrandr | grep "DP-1 connected"; then
  xrandr --newmode "3840x2160_30.00"  339.57  3840 4080 4496 5152  2160 2161 2164 2197  -hsync +vsync
  xrandr --addmode DP-1 "3840x2160_30.00"
fi

xrdb -merge $HOME/.Xresources
exec i3
