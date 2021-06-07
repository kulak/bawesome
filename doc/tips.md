# Tips

## Collect Key

Use `xev` program to read key codes.  On Arch install `xorg-xev` package.

## Window Properties

To get application properties for rules:

    xprop WM_CLASS WM_NAME

## Easy Debug of External Calls

```lua
function module.exec(cmd, msg)
    awful.spawn.easy_async_with_shell(cmd, function(cmdout, cmderr)
        naughty.notify({
            text = msg .. cmdout .. cmderr,
            timeout = 0,
        })
    end)
end```
