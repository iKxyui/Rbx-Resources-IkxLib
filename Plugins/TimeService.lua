--[[

Script Type : Module
Script Name : TimeService

]]--

local TimeService = {
	OS = {};
	RS = {};
}

local PlSettings = require(script.Parent._Settings)

local DelayTypes = {
	[""] = function(Int)
		Int = Int or 0
	end;
	["Seconds"] = function(Int)
		Int = Int or 0
	end;
	["Frames"] = function(Int)
		Int = (Int/60) or 0
	end;
}

local function SetDelType(Int)
	DelayTypes[PlSettings.TimeServiceMeasurement](Int)
end

function TimeService.OS:SetDelay(Int)
	Int = Int or 0
	SetDelType(Int)
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
	Int = Int or 0
	SetDelType(Int)
	local Delta = 0
	repeat Delta = Delta + game:GetService("RunService").Heartbeat:Wait() until Delta > Int
end

return TimeService