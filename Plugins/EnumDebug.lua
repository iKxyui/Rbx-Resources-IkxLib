--[[

Script Type : Module
Script Name : EnumDebug

]]--

local EnumDebug = {}

function EnumDebug:GetEnumFromValue(Enum1, Value)
	return Enum1:GetEnumItems()[Value]
end

return EnumDebug