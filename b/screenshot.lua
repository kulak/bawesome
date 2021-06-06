local awful = require("awful")
local naughty = require("naughty")

local module = {
    delay_secs = 5,
}
function module.init(my)
    module.delay_secs = my.screenshot_delay_secs
end

function module.screen()
    module.exec("xfce4-screenshooter --fullscreen", "Took screen screenshot")
end

function module.screen_delay(my)
    module.exec("xfce4-screenshooter --fullscreen -d " .. module.delay_secs, "Took screen screenshot")
end

function module.selection()
    module.exec("xfce4-screenshooter --region", "Took selection screenshot")
end

function module.window()
    module.exec("xfce4-screenshooter --window", "Took window screenshot")
end

function module.exec(cmd, msg)
    awful.spawn.easy_async_with_shell(cmd, function(cmdout, cmderr)
        -- uncomment to debug
        --     naughty.notify({
        --         text = msg .. cmdout .. cmderr,
        --         timeout = 0,
        --     })
    end)
end

return module