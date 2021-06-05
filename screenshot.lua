local awful = require("awful")
local naughty = require("naughty")

function scrot_full()
    scrot("xfce4-screenshooter --fullscreen", scrot_callback, "Took screen screenshot")
end

function scrot_selection()
    scrot("xfce4-screenshooter --region", "Took selection screenshot")
end

function scrot_window()
    scrot("xfce4-screenshooter --window", scrot_callback, "Took window screenshot")    
end

function scrot(cmd, msg)
    awful.spawn.easy_async_with_shell(cmd, function(cmdout, cmderr)
        -- uncomment to debug
        --     naughty.notify({
        --         text = msg .. cmdout .. cmderr,
        --         timeout = 0,
        --     })
    end)
end
