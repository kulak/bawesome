local awful = require("awful")

local module = {}

function module.init(my) end

-- Attempts to run only one instance of the process.
-- Use 'pidof' to see if process ID can be found by name.
-- If PID does not exist, start supplied application.
-- If PID exists, do nothing.
-- Attention: This works only if there is single user session on the machine.
function module.run_single(exeName, exeArgs)
    awful.spawn.easy_async(
        -- pidof returns non-zero code if nprocess is not found
        'pidof ' .. exeName, function(cmdout, cmderr, exitreason, exitcode)
            if exitcode ~= 0 then
                -- process does not exist, create it
                awful.spawn(exeName .. ' ' .. exeArgs)
            end
        end
    )
end

return module
