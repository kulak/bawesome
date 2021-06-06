local awful = require("awful")

local taskbar = {}

function taskbar.init(menubar, hotkeys_popup, beautiful, my)
    -- {{{ Menu
    -- Create a launcher widget and a main menu
    taskbar.myawesomemenu = {
        { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "manual", my.terminal .. " -e man awesome" },
        { "edit config", my.editor_cmd .. " " .. awesome.conffile },
        { "retaskbar", awesome.retaskbar },
        { "quit", function() awesome.quit() end },
    }
    
    taskbar.mymainmenu = awful.menu({ items = { { "awesome", taskbar.myawesomemenu, beautiful.awesome_icon },
                                        { "Applications", my.xdg_menu },
                                        { "open terminal", my.terminal }
                                    }
                            })
    
    taskbar.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                        menu = taskbar.mymainmenu })
    
    -- Menubar configuration
    menubar.utils.terminal = my.terminal -- Set the terminal for applications that require it
    -- }}}
 end
 
 return taskbar