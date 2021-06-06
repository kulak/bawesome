local awful = require("awful")

local taskbar = {}

function taskbar.init(menubar, hotkeys_popup, beautiful, terminal, editor_cmd)
    -- {{{ Menu
    -- Create a launcher widget and a main menu
    taskbar.myawesomemenu = {
        { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "manual", terminal .. " -e man awesome" },
        { "edit config", editor_cmd .. " " .. awesome.conffile },
        { "retaskbar", awesome.retaskbar },
        { "quit", function() awesome.quit() end },
    }
    
    taskbar.mymainmenu = awful.menu({ items = { { "awesome", taskbar.myawesomemenu, beautiful.awesome_icon },
                                        { "Applications", xdgmenu },
                                        { "open terminal", terminal }
                                    }
                            })
    
    taskbar.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                        menu = taskbar.mymainmenu })
    
    -- Menubar configuration
    menubar.utils.terminal = terminal -- Set the terminal for applications that require it
    -- }}}
 end
 
 return taskbar