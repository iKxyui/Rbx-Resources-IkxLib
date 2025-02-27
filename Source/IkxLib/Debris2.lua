--[[

Script Type : Module
Script Name : Debris2

]]--

--[[ 
	Debris2 = {
		Instances {
			[Debris: instance or table or RBXScriptConnection] = {
				lifeTime = lifeTime: number,
				removalTime = tick() + lifeTime: number,
				Destroyed = nil, -- Destroyed: callback Function | nil by default
				Cancel = function -- remove references and disconnect Hearbeat
				Instance = item: (Instance or table or RBXScriptConnection),
			},
		},
	}
--]]

local Debris2 = {
	Instances = {}
}

local RunService = game:GetService("RunService")
local Heatbeat = RunService.Heartbeat

local Instances = Debris2.Instances

local Connections = {}

local ValidTypes = {
	["Instance"] = "Destroy",
	["table"] = true,
	["RBXScriptConnection"] = "Disconnect",
}

local METHODS = { -- add any Custom Destroy/Remove/Clear/CleanUp methods here
	"Destroy",
	"Disconnect",

	"destroy",
	"disconnect",
}

local function removeItem(typeOf, object)
	if typeOf == "Instance" then
		pcall(object.Destroy, object)
	elseif typeOf == "RBXScriptConnection" then
		pcall(object.Disconnect, object)
	else
		for _,v in ipairs(METHODS) do -- _, v: method name
			if object[v] then
				pcall(object[v], v)
				break
			end
		end
	end
end

local function addDebris(object, lifeTime)
	local typeOf = typeof(object)

	assert(ValidTypes[typeof(object)])
	assert(typeof(lifeTime) == "number")

	if (not Instances[object]) then
		table.insert(Instances, object)
	end

	Instances[object] = {
		["lifeTime"] = lifeTime,
		removalTime = tick() + lifeTime,
		-- Destroyed = nil, -- Destroyed: callback Function
		Cancel = function() -- remove references and disconnect Hearbeat
			Connections[object]:Disconnect()
			table.remove(Instances,table.find(Instances, object))
			Instances[object] = nil
		end,
		["Instance"] = object,
	}

	local debris = Instances[object]

	Connections[object] = Heatbeat:Connect(function()
		if debris and tick() >= debris.removalTime then
			if debris.Destroyed then
				debris.Destroyed()
			end
			debris.Cancel()
			removeItem(typeOf,object)
		end
		debris = Instances[object]
	end)

	return Instances[object]
end

function Debris2:AddItem(item, lifeTime)
	return addDebris(item, lifeTime)
end

function Debris2:AddItems(arrayOfItems, lifeTime)
	for _,item in ipairs(arrayOfItems) do
		addDebris(item, lifeTime)
	end
end

function Debris2:GetAllDebris()
	return Instances
end
Debris2.getAllDebris = Debris2.GetAllDebris

function Debris2:GetDebris(item)
	return Instances[item]
end
Debris2.getDebris = Debris2.GetDebris

return Debris2