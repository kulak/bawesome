local awful = require("awful")
local naughty = require("naughty")

local pa_widget = {}

function pa_widget.up()
    with_current_sink("pactl set-sink-volume %s +350")
end

function pa_widget.down()
    with_current_sink("pactl set-sink-volume %s -350")
end

function pa_widget.mute_toggle()
    with_current_sink("pactl set-sink-mute %s toggle")
end

function with_current_sink(cmd)
    awful.spawn.easy_async_with_shell("pactl list short sinks | grep RUNNING | cut -f1", function(cmdout, cmderr)
        -- strip new line character from cmdout
        local sink = string.gsub(cmdout, "\n", "")
        awful.spawn.with_shell(string.format(cmd, sink))
    end)
end

return pa_widget