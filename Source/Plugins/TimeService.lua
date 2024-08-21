--[[

Script Type : Module
Script Name : TimeService

]]--

local TimeService = {
	OS = {};
	RS = {};
	Functions = {};
}

local PlSettings = require(script.Parent._SETTINGS)

local DelayTypes = {
	[""] = function(Int)
		return Int or 0
	end;
	["Seconds"] = function(Int)
		return Int or 0
	end;
	["Frames"] = function(Int)
		return (Int/60) or 0
	end;
}

function TimeService.OS:SetDelay(Int)
	Int = DelayTypes[PlSettings.TimeServiceMeasurement](Int)
	local OSTime = os.clock()
	local DelayTime = Int - 0.003
	while true do
		if os.clock() >= (OSTime + DelayTime) then
			break
		end
		game:GetService("RunService").Stepped:Wait()
	end
end

function TimeService.RS:SetDelay(Int)
	Int = DelayTypes[PlSettings.TimeServiceMeasurement](Int)
	local Delta = 0
	repeat Delta = Delta + game:GetService("RunService").Heartbeat:Wait() until Delta > Int
end

function TimeService.Functions:DisplayTimeFromInt64(Time)
	Time = Time or 0
	local Days = math.floor(Time/86400)
	local Remaining = Time % 86400
	local Hours = math.floor(Remaining/3600)
	Remaining = Remaining % 3600
	local Minutes = math.floor(Remaining/60)
	Remaining = Remaining % 60
	local Seconds = Remaining
	if (Hours < 10) then
		Hours = "0" .. tostring(Hours)
	end
	if (Minutes < 10) then
		Minutes = "0" .. tostring(Minutes)
	end
	if (Seconds < 10) then
		Seconds = "0" .. tostring(Seconds)
	end
	local SetTime = tostring(Days)..':'..Hours..':'..Minutes..':'..Seconds
	return SetTime
end

return TimeService