local awful = require("awful")
local naughty = require("naughty")

local pa_widget = {
    pa_volume_delta = "350"
}

function pa_widget.init(my)
    if my.pa_volume_delta then
        pa_widget.pa_volume_delta = my.pa_volume_delta
    end
end

function pa_widget.up()
    with_current_sink("pactl set-sink-volume %s +" .. pa_widget.pa_volume_delta)
end

function pa_widget.down()
    with_current_sink("pactl set-sink-volume %s -" .. pa_widget.pa_volume_delta)
end

function pa_widget.mute_toggle()
    with_current_sink("pactl set-sink-mute %s toggle")
end

function pa_widget.pavucontrol()
    awful.spawn("pavucontrol")
end

function with_current_sink(cmd)
    awful.spawn.easy_async_with_shell("pactl list short sinks | grep RUNNING | cut -f1", function(cmdout, cmderr)
        -- strip new line character from cmdout
        local sink = string.gsub(cmdout, "\n", "")
        awful.spawn.with_shell(string.format(cmd, sink))
    end)
end

return pa_widget