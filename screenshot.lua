local awful = require("awful")
local naughty = require("naughty")

function scrot_full()
    exec("xfce4-screenshooter --fullscreen", "Took screen screenshot")
end

function scrot_selection()
    exec("xfce4-screenshooter --region", "Took selection screenshot")
end

function scrot_window()
    exec("xfce4-screenshooter --window", "Took window screenshot")
end

function exec(cmd, msg)
    awful.spawn.easy_async_with_shell(cmd, function(cmdout, cmderr)
        -- uncomment to debug
        --     naughty.notify({
        --         text = msg .. cmdout .. cmderr,
        --         timeout = 0,
        --     })
    end)
end
