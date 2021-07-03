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

## References

1. [b/xrandr.lua source](https://awesomewm.org/recipes/xrandr/)
