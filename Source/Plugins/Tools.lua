--[[

Script Type : Module
Script Name : Tools

]]--

local Tools = {UI = {}; TableMethods = {};}

local RunService = game:GetService("RunService")

function Tools.UI:ScaleToOffset(Scale)
	local ViewPortSize = workspace.Camera.ViewportSize
	return ({ViewPortSize.X * Scale[1],ViewPortSize.Y * Scale[2]})
end

function Tools.UI:OffsetToScale(Offset)
	local ViewPortSize = workspace.Camera.ViewportSize
	return ({Offset[1] / ViewPortSize.X, Offset[2] / ViewPortSize.Y})
end

function Tools.TableMethods:SetModuleKeyOrder(Tbl) -- Creates a proxy table that tracks key order
	local KeyOrder = {}
	local MT = {
		__index = Tbl,
		__newindex = function(t, key, value)
			if not rawget(Tbl, key) then
				table.insert(KeyOrder, key)
			end
			rawset(Tbl,key,value)
		end
	}
	return setmetatable(Tbl,MT), KeyOrder
end

function Tools.TableMethods:GetOrderedArray(Tbl,KeyOrder)
	local NewArray = {}
	for _,key in ipairs(KeyOrder) do
		table.insert(NewArray,Tbl[key])
	end
	return NewArray
end

function Tools:SetModule(ModuleInstance:ModuleScript,Function,Args)
	require(ModuleInstance)[Function](Args[1],Args[2],Args[3],Args[4],Args[5],Args[6],Args[7],Args[8],Args[9])
end

function Tools:SetThreadToBuiltInFunction(SetBuiltInFunction,...)
	local Thread = coroutine.wrap(SetBuiltInFunction)
	Thread(...)
end

function Tools:ApplyFunctionToObjectGroup(Group,SearchFor,...)
	SearchFor = SearchFor or {}
	for _,GetChild in pairs(Group:GetChildren()) do
		if (SearchFor.Name ~= nil and GetChild.Name == SearchFor.Name) then
			task.spawn(...,GetChild)
			continue
		end
		if (SearchFor.IsA ~= nil and GetChild:IsA(SearchFor.IsA)) then
			task.spawn(...,GetChild)
			continue
		end
		if (SearchFor.Tag ~= nil and GetChild:HasTag(SearchFor.Tag)) then
			task.spawn(...,GetChild)
		end
	end
end

function Tools:SetDeltaStepToLoopFoundation()
	RunService.PreSimulation:Wait()
end

return Tools