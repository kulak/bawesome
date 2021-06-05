# README

## Overview

This is just a specific `awesomewm` configuration that works well on ArchLinux.

When DE tools can be used we opt for XFCE4 applications.  This configuration is developed on Arch Linux.

**Status:** it works, but could be fine tuned more.

## Installation

Clone into `$XDG_CONFIG_HOME` directory or `$HOME/.config`:

```
cd $HOME/.config
git clone https://github.com/Kulak/bawesome.git awesome
```

## Features

### Blue Color Scheme

The color scheme is just a copy of default scheme with tweaks to improve usability.

The color scheme uses classic blue color to indicate window in focus.  It uses blue window border for focused window.  This visually connects "taskbar" area with window border and makes it more intuitive to identify focused window.

Non-focused windows are of darker blue color.

Minimized windows have dark background.

Keyboard shortcuts text in Help dialog window is readble. 

### Better Launcher

Use of "rofi" as launcher, because it is easy to see and to read.  Default launcher steals focus and its focus can be easily missed.

### Alt-Tab Window Switcher

"rofi" is used as Window Switcher and matches standard "Alt-Tab" keyboard shortcut.

### Standard Extended Keys are Mapped

Volume UP and Down keyboard keys are mapped to applications that raise and reduce the volume.

Monitor brightness control keys are mapped.

## External Dependencies

1. [rofi](https://archlinux.org/packages/community/x86_64/rofi/)
2. [xfce4-screenshooter](https://archlinux.org/packages/extra/x86_64/xfce4-screenshooter/)
3. [pactl](https://archlinux.org/packages/extra/x86_64/libpulse/) to raise and reduce volume
4. [amixer](https://archlinux.org/packages/extra/x86_64/alsa-utils/) to mute (needs to be removed)
5. [laptop monitor brightness](sudo pacman -S xorg-xbacklight)
