local io = require("io")
local wibox = require("wibox")

local webwidget = wibox.widget.textbox()

local function status()
	local f = assert(io.popen("iw wlo1 link", 'r'))
	local s = assert(f:read("*a"))
	f:close()

	local ssid, signal = s:match(".*SSID: (.*).*signal: (.%d+) dBm")

	return " " .. ssid
end


local mytimer = timer({timeout=1})
mytimer:connect_signal("timeout", function()
	webwidget.text = " " .. status() .. " "
end)

mytimer:start()
return webwidget
