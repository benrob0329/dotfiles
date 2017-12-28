local io = require("io")
local wibox = require("wibox")
local naughty = require("naughty")

local battw = wibox.widget.textbox()

local function status()
	local f = assert(io.popen("acpi", 'r'))
	local s = assert(f:read('*a'))
	f:close()

	local state, charge = s:match("Battery 0: (.*), (%d+)%%")

	if charge and state then
		charge = tonumber(charge)
	else
		return false
	end

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

local mytimer = timer({timeout=1})
mytimer:connect_signal("timeout", function()
	local text = status()
	if text then
		battw.text = " " .. status() .. " "
	else
		battw.text = ""
	end
end)

mytimer:start()
return battw
