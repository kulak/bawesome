# README

## Overview

This is just a specific `awesomewm` configuration that works well on ArchLinux.

This project is not an invention of how things shall be done, but a good maintained example of how to configure `awesomewm` for daily use.  It is a current solution to various daily desktop usage needs of the author and is shared here in the hope of helping others to start with `awesomewm`.  The author uses XFCE4 as a backup DE. XFCE tools are used when appropriate.  Screenshot tool is a good example.

**Status:** it is in daily use.

## Installation

Clone into `$XDG_CONFIG_HOME` directory or `$HOME/.config`:

```
cd $HOME/.config
git clone https://github.com/Kulak/bawesome.git awesome
cd awesome
git submodule init
git submodule update
```

## Screenshots

- [on screen help](doc/images/on-screen-help.png) demonstrates that all on screen help text is readable
- [run application](doc/images/rofi.png) provides a quick way to start application with `command-shift-Enter` shortcut.
- [clipboard manager](doc/images/clipboard-manager.png)
- [active window](doc/images/active-window.png) is at the bottom right corner of the screenshot and it has a lighter blue border around the window than others.

## Features

Features at a glance copared to default script:

- better launcher
- blue color scheme
- active window highlight
- readable help screen window
- multiple monitor support
- keyboard shortcuts to manage sound volume mapped to keyboard "volume" management buttons
- laptop keyboard highlight with keyboard shortcuts
- automatic laptop power indicator visible only when battery is present
- screenshooter with keyboard shortcuts
- optional require
- better support for spawning a process
- parts of configuration script are overridable without need to commit upstream
- one large rc script is broken into manageable parts with clear dependencies between scripts (reduced reliance on globals)

### Blue Color Scheme

The color scheme is just a copy of default scheme with tweaks to improve usability.

The color scheme uses classic blue color to indicate window in focus.  It uses blue window border for focused window.  This visually connects "taskbar" area with window border and makes it more intuitive to identify focused window.

Non-focused windows are of darker blue color.

Minimized windows have dark background.

Keyboard shortcuts text in Help dialog window is readble. 

### XFCE4 Screenshooter

Mapped nice XFCE4 screenshot taking application to standard set of Print Scr key combinations.

### Better Launcher

Use of "rofi" as launcher, because it is easy to see and to read.  Default launcher steals focus and its focus can be easily missed.

### Alt-Tab Window Switcher

"rofi" is used as Window Switcher and matches standard "Alt-Tab" keyboard shortcut.

### Standard Extended Keys are Mapped

Keyboard volume management keys (up, down and mute toggle) are properly mapped via `pactl`.

Monitor brightness control keys are mapped.

### Battery Power Widget

Requires loading GIT submodule.

## Overrides

### Applications Menu

To generate "classic" menu for your installed applicatinons:

    xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu > ~/.config/awesome/overrides/xdg_menu.lua

About [xdg_menu](https://wiki.archlinux.org/title/Xdg-menu) on ArchLinux.

### Machine Specific Configuration Paramters

Create `overrides/my.lua` file.  Start with template:

```sh
cp overrides/templates/my.lua overrides/my.lua
```

### Arrange Multiple Monitors

Included `randr` script from the main website and mapped it to `command-O` to turn on and off multiple monitors.

## External Dependencies

References are to Arch Linux packages.  Use "Upstream URL" on corresponding package pages to identify actual application dependency for your Linux distribution.

1. [alacritty](https://archlinux.org/packages/community/x86_64/alacritty/) default terminal emulator, overridable.
2. [vim](https://archlinux.org/packages/extra/x86_64/vim/) required internally.
3. [rofi](https://archlinux.org/packages/community/x86_64/rofi/) for effecient program and window management.
3. XFCE4 Tools
- [xfce4-screenshooter](https://archlinux.org/packages/extra/x86_64/xfce4-screenshooter/);
- [xfce4-clipman](https://archlinux.org/packages/extra/x86_64/xfce4-clipman-plugin/) for screenshooter clipboard support.
4. [pactl](https://archlinux.org/packages/extra/x86_64/libpulse/) to raise and reduce volume.
5. [pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/) pulse audio UI control.
6. [xbacklight](https://archlinux.org/packages/extra/x86_64/xorg-xbacklight/) for laptop monitor brightness.
7. [pgrep](https://archlinux.org/packages/core/x86_64/procps-ng/) to start programs once.
8. [whoami](https://archlinux.org/packages/core/x86_64/coreutils/).