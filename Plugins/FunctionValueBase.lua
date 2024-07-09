--[[

Script Type : Module
Script Name : FunctionValueBase

]]--

local FunctionValueBase = {}

type IndexableValueBase = ValueBase & { Value: any }

function FunctionValueBase:CreateFunctionFromValueBase(ValueObject: Instance,Function,...)
    local Thread = coroutine.wrap(Function)
    if ValueObject:IsA("ValueBase") then
        print((ValueObject::IndexableValueBase).Value)
	    Thread(...)
    end
end

return FunctionValueBase