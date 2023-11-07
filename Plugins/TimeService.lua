--[[ Setup ]]--
local TimeService = {
    OS = {};
    RS = {};
}

--[[ Modules ]]--
local PlSettings = require(script.Parent._Settings)

--[[ Functions ]]--
local function SetDelType(Int)
    local Case = {
        [""] = function()
            Int = Int or 0
        end;
        ["Seconds"] = function()
            Int = Int or 0
        end;
        ["Frame"] = function()
            Int = (Int/60) or 0
        end;
    }; Case[PlSettings.TimeService.DelayTime]();
end

--[[ Methods ]]--
function TimeService.OS:Wait(Int)
    Int = Int or 0
    SetDelType(Int)
    local OSTime = os.clock()
    local DelayTime = Int - 0.0095
    while true do
        if os.clock() >= (OSTime + DelayTime) then
            break
        end
        game:GetService("RunService").Heartbeat:Wait()
    end
end

function TimeService.RS:Wait(Int)
    Int = Int or 0
    SetDelType(Int)
    local Delta = 0
    repeat Delta = Delta + game:GetService("RunService").Heartbeat:Wait() until Delta > Int
end

return TimeService