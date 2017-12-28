local io = require("io")
local wibox = require("wibox")

local brightw = wibox.widget.textbox()

if require("hostname") ~= "benrob0329-laptop" then
	return brightw end

local function status()
	local f = assert(io.popen("xbacklight", "r"))
	local s = assert(f:read("*a"))
	f:close()

	local brightness = math.floor(tonumber(s))

	return " " .. brightness
end

local mytimer = timer({timeout = 1})
mytimer:connect_signal("timeout", function()
	brightw.text = " " .. status() .. " "
end)

mytimer:start()
return brightw
