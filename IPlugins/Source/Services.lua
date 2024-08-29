--[[

Script Type : Module
Script Name : Services

]]--

local Services = {Debug = {};}

local PlSettings = require(script.Parent._SETTINGS)

function Services.Debug:DebugStringSpacing(ServiceStr)
	return string.gsub(ServiceStr,"Service"," Service")
end

function Services:MonoBehavior()
	if PlSettings.EnableGetServicesMonoBehavior == false then
		warn("GetService MonoBehavior is disabled")
		return nil
	end

	local GetServices = {}

	for i,v in pairs(game:GetChildren()) do
		if string.match(v.Name,"Service") then
			table.insert(GetServices,v)
		end
	end

	function GetServices:Require(ServiceStr)
		local String = Services.Debug:DebugStringSpacing(ServiceStr)
		local GetServiceFromString
		for i2,v2 in pairs(GetServices) do
			if i2 ~= "Require" and v2.Name == String then
				GetServiceFromString = v2
				break
			end
		end
		return GetServiceFromString
	end

	return GetServices
end

return Services