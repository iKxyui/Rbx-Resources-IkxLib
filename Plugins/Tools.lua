--[[

Script Type : Module
Script Name : Tools

]]--

local Tools = {UI = {}}

local RunService = game:GetService("RunService")

function Tools.UI:ScaleToOffset(Scale)
	local ViewPortSize = workspace.Camera.ViewportSize
	return ({ViewPortSize.X * Scale[1],ViewPortSize.Y * Scale[2]})
end

function Tools.UI:OffsetToScale(Offset)
	local ViewPortSize = workspace.Camera.ViewportSize
	return ({Offset[1] / ViewPortSize.X, Offset[2] / ViewPortSize.Y})
end

function Tools:SetModule(ModuleType,Function,Arg01,Arg02,Arg03,Arg04,Arg05)
	coroutine.resume(coroutine.create(function()
		local Module = require(ModuleType)
		Module[Function](Arg01,Arg02,Arg03,Arg04,Arg05)
	end))
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