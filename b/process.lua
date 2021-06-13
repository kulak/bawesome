local awful = require("awful")

local module = {}

function module.init(my)
end

-- Attempts to run only one instance of the process.
-- 
-- It searches for the process name belonging to the current user
-- and starts new process with exeArgs if none was found.
--
-- The function should be safe for multi-user environment.
function module.run_single(exeName, exeArgs)
    module.with_user(function(user)
        -- -c returns count of matching processes
        -- -u $USER restricts search to the user
        -- pgrep exits with 0 if found matches and 1 if not found.
        awful.spawn.easy_async('pgrep -c -u ' .. user .. ' ' .. exeName, function(cmdout, cmderr, exitreason, exitcode)
            if exitcode ~= 0 then
                -- process was not found, create new process
                awful.spawn(exeName .. ' ' .. exeArgs)
            end
        end)
    end)
end

-- loads current user name and calls a function delegate with that user
function module.with_user(funcWithUser)
    awful.spawn.easy_async("whoami", function(cmdout, cmderr, exitreason, exitcode)
        if exitcode == 0 then
            -- strip new line character from end of stream
            local user = string.gsub(cmdout, "\n", "")
            funcWithUser(user)
        else
            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "whoami call failed",
                text = cmderr,
                timeout = 0
            })
        end
    end)
end

return module
