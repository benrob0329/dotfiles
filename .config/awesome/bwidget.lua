local io = require("io")
local wibox = require("wibox")
local naughty = require("naughty")

local battw = wibox.widget.textbox()

if require("hostname") == "benrob0329-laptop" then
	return battw end

local battstat = function()
	local f = assert(io.popen("acpi", 'r'))
	local s = assert(f:read('*a'))
	f:close()

	local state, charge = s:match("Battery 0: (.*), (%d+)%%")

	charge = tonumber(charge)

	if state == "Charging" then
		if battw.text:match("") then
			return " " .. charge .. "%"
		elseif battw.text:match("") then
			return " " .. charge .. "%"
		elseif battw.text:match("") then
			return " " .. charge .. "%"
		else return " " .. charge .. "%"
		end
	end

	if charge <= 10 then
		naughty.notify({title="Low Battery", text="Battery is at " .. charge, timeout=1})
	end

	if charge <= 25 then
		return " " .. charge .. "%"
	elseif charge <= 50 then
		return " " .. charge .. "%"
	elseif charge <= 75 then
		return " " .. charge .. "%"
	elseif charge <= 100 then
		return " " .. charge .. "%"
	end
end

battw.text = " " .. battstat() .. " "

local mytimer = timer({timeout=1})
mytimer:connect_signal("timeout", function()
	battw.text = " " .. battstat() .. " "
end)

mytimer:start()
return battw
