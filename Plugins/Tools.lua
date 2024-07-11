--[[

Script Type : Module
Script Name : Tools

]]--

local Tools = {}

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

function Tools:SetDeltaStepToLoopFoundation()
	game:GetService("RunService").Stepped:Wait()
end

return Tools