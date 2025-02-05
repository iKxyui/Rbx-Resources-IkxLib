--[[

Script Type : Module
Script Name : MaterialDecode

]]--

local MaterialDecode = {}

MaterialDecode.MaterialList = {
	[Enum.Material.Ground] = "Ground";
	[Enum.Material.Neon] = "Neon";
	[Enum.Material.ForceField] = "ForceField";
	[Enum.Material.SmoothPlastic] = "SmoothPlastic";
	[Enum.Material.Air] = "Air";
	[Enum.Material.Glass] = "Glass";
	[Enum.Material.Ice] = "Ice";
	[Enum.Material.Slate] = "Slate";
	[Enum.Material.Plaster] = "Plaster";
	[Enum.Material.Mud] = "Mud";
	[Enum.Material.Foil] = "Foil";
	[Enum.Material.Rock] = "Rock";
	[Enum.Material.Salt] = "Salt";
	[Enum.Material.Sand] = "Sand";
	[Enum.Material.Snow] = "Snow";
	[Enum.Material.Wood] = "Wood";
	[Enum.Material.Brick] = "Brick";
	[Enum.Material.Grass] = "Grass";
	[Enum.Material.Metal] = "Metal";
	[Enum.Material.Water] = "Water";
	[Enum.Material.Basalt] = "Basalt";
	[Enum.Material.Carpet] = "Carpet";
	[Enum.Material.Fabric] = "Fabric";
	[Enum.Material.Marble] = "Marble";
	[Enum.Material.Pebble] = "Pebble";
	[Enum.Material.Rubber] = "Rubber";
	[Enum.Material.Asphalt] = "Asphalt";
	[Enum.Material.Glacier] = "Glacier";
	[Enum.Material.Granite] = "Granite";
	[Enum.Material.Leather] = "Leather";
	[Enum.Material.Plastic] = "Plastic";
	[Enum.Material.Concrete] = "Concrete";
	[Enum.Material.Pavement] = "Pavement";
	[Enum.Material.Cardboard] = "Cardboard";
	[Enum.Material.Limestone] = "Limestone";
	[Enum.Material.Sandstone] = "Sandstone";
	[Enum.Material.LeafyGrass] = "LeafyGrass";
	[Enum.Material.WoodPlanks] = "WoodPlanks";
	[Enum.Material.Cobblestone] = "Cobblestone";
	[Enum.Material.CrackedLava] = "CrackedLava";
	[Enum.Material.CeramicTiles] = "CeramicTiles";
	[Enum.Material.DiamondPlate] = "DiamondPlate";
	[Enum.Material.RoofShingles] = "RoofShingles";
	[Enum.Material.ClayRoofTiles] = "ClayRoofTiles";
	[Enum.Material.CorrodedMetal] = "CorrodedMetal";
}

function MaterialDecode:SetMaterialToString(Value)
	return MaterialDecode.MaterialList[Value]
end

function MaterialDecode:GetMaterialStringFormat(MaterialType)
	local Success, Material = xpcall(function()
		return Enum.Material:FromName(MaterialType).Name
	end, function()
		return "Unknown Material"
	end)
	return Material
end

return MaterialDecode