# Tips


## Collect Key

Use `xev` program to read key codes.  On Arch install `xorg-xev` package.

## Window Properties

To get application properties for rules:

    xprop WM_CLASS WM_NAME


## Easy Debug of External Calls

```lua
local naughty = require("naughty")

function module.exec(cmd, msg)
    awful.spawn.easy_async_with_shell(cmd, function(cmdout, cmderr)
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "message title",
            text = cmdout .. cmderr,
            timeout = 0,
        })
    end)
end
```


## Keyboard Layout

Language layout of the keyboard is NOT controlled by `awesomewm`.

The following example demonstrates how to configure EN and RU keyboards with phonetic Russian layout.  There are a couple ways to enter the command in terminal window, but the result is going to be the same:

Form 1 with all in one:

```sh
setxkbmap -model pc105 -option -option "grp:ctrls_toggle" "us,ru(phonetic_YAZHERTY)"
```

Form 2 with layout and variant:

```sh
setxkbmap -model pc105 -option -option "grp:ctrls_toggle" -layout "us,ru" -variant ",phonetic_YAZHERTY"
```

To make the above configuration permanent one needs to add it to desktop environment startup script. It can be done in `rc.lua` or it can be done with `lightdm` or its equivalent on your system.

If you are using `lightdm` or other display manager that loads configuration from `~/.xprofile` file, then it might be the best to append the line listed above to `$HOMe/.xprofile` file.

Keyboard widget used by the `awesomewm` configuration in this project will display current lanauge automatically and clicking on it will switch the language.


## References

1. [b/xrandr.lua source](https://awesomewm.org/recipes/xrandr/)
