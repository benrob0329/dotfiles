local io = require("io")
local wibox = require("wibox")

local brightw = wibox.widget.textbox()

local brightstat = function()
	local f = assert(io.popen("xbacklight", "r"))
	local s = assert(f:read("*a"))
	f:close()

	local brightness = math.floor(tonumber(s))

	return " " .. brightness
end

brightw.text = " " .. brightstat() .. " "

local mytimer = timer({timeout = 1})
mytimer:connect_signal("timeout", function()
	brightw.text = " " .. brightstat() .. " "
end)

mytimer:start()
return brightw
