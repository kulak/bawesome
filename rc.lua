-- Entry Point
-- returns module or nil
local function optional_require(m)
    local ok, err = pcall(require, m)
    if not ok then
        return nil, err
    end
    return err
end

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local process = require('b/process')
local my_overrides = optional_require("overrides/my")

require('b/error_handling')

local taskbar = require('b/taskbar')
local wibar = require('b/wibar')
local key_bindings = require('b/key_bindings')
local rules = require('b/rules')
local signals = require('b/signals')

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "default/theme.lua")

-- defaults
local editor = os.getenv("EDITOR") or "vim"
local my = {}
my.terminal = "alacritty"
my.editor_cmd = my.terminal .. " -e " .. editor
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
my.modkey = "Mod4"
-- load xdg_menu generated menu items, if 'xdg_menu.lua' exists
optional_require("overrides/xdg_menu")
my.xdg_menu = xdgmenu -- from overrides/xdg_menu
my.screenshot_delay_secs = 5

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- awful.layout.suit.floating,
    awful.layout.suit.spiral,
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

if my_overrides then
    my_overrides.init(my)
end

process.init(my)
taskbar.init(menubar, hotkeys_popup, beautiful, my)
wibar.init(taskbar, beautiful, my)

-- {{{ Mouse bindings
root.buttons(
    gears.table.join(
        awful.button(
            {}, 3, function() taskbar.mymainmenu:toggle() end
        ), awful.button({}, 4, awful.tag.viewnext),
        awful.button({}, 5, awful.tag.viewprev)
    )
)
-- }}}

key_bindings.init(my, hotkeys_popup, taskbar, menubar)

rules.init(beautiful, key_bindings)

signals.init(beautiful)

process.run_single("xfce4-clipman", "")
