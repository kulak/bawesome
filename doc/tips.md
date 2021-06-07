# Tips

## Collect Key

Use `xev` program to read key codes.  On Arch install `xorg-xev` package.

## Window Properties

To get application properties for rules:

    xprop WM_CLASS WM_NAME

## To Debug

```lua
naughty.notify({
    text = msg .. cmdout .. cmderr,
    timeout = 0, -- don't remove automatically
})
```
