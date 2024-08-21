--[[

Script Type : Module
Script Name : MathFunctions

]]--

local LuaMath = math

local MathFunctions = {}

function MathFunctions:RoundNumber(Number,DecimalPlaces)
	return tonumber(string.format("%." .. (DecimalPlaces or 0) .. "f", Number))
end

function MathFunctions:GetPercentageFromLowToHigh(x,Low,High)
	local Range = High - Low
	return LuaMath.clamp(1 - (x - Low) / Range, 0, 1)
end

function MathFunctions:GenerateRandomSeed()
	return LuaMath.floor(os.clock()*1000000)
end

function MathFunctions:SetMinimum(Num,MinNum)
	Num = Num or 0
	MinNum = MinNum or 0
	if Num <= MinNum then
		Num = MinNum
	end
	return Num
end

function MathFunctions:SetMaximum(Num,MaxNum)
	Num = Num or 0
	MaxNum = MaxNum or 0
	if Num >= MaxNum then
		Num = MaxNum
	end
	return Num
end

return MathFunctions