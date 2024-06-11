--

Script Type : Module
Script Name : MathFunctions

]]--

local MathFunctions = {}

function MathFunctions:RoundNumber(Number,DecimalPlaces)
	return tonumber(string.format("%." .. (DecimalPlaces or 0) .. "f", Number))
end

return MathFunctions