local awful = require("awful")
local naughty = require("naughty")

local module = {
    delay_secs = 5,
}
function module.init(my)
    module.delay_secs = my.screenshot_delay_secs
end

function module.screen()
    module.exec("xfce4-screenshooter --fullscreen")
end

function module.screen_delay(my)
    module.exec("xfce4-screenshooter --fullscreen -d " .. module.delay_secs)
end

function module.selection()
    module.exec("xfce4-screenshooter --region")
end

function module.window()
    module.exec("xfce4-screenshooter --window")
end

function module.exec(cmd)
    awful.spawn.with_shell(cmd)
end

return module