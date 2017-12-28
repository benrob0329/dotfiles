local io = require("io")
local wibox = require("wibox")

local awidget = wibox.widget.textbox()

if require("hostname") ~= "benrob0329-laptop" then
	return awidget end

local status = function()
	local f = assert(io.popen("amixer sget Master"))
	local s = assert(f:read("*a"))
	f:close()

	local volume = s:match("%[(%d+)%%%]")
	local enabled = s:match("%[on%]")

	volume = tonumber(volume)

	if enabled == "[on]" then
		if volume < 50 then
			return " " .. volume .. "%"
		else
			return " " .. volume .. "%"
		end
	else
		return " Sound Muted"
	end
end

local mytimer = timer({timeout=1})
mytimer:connect_signal("timeout", function()
	awidget.text = " " .. status() .. " "
end)

mytimer:start()
return awidget
