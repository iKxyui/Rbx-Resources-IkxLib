--[[

Script Type : Module
Script Name : TimeService

]]--

local TimeService = {
	OS = {};
	RS = {};
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

return TimeService