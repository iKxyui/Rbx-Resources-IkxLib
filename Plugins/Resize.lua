--[[

Script Type : Module
Script Name : Resize

]]--

--// Resize models keeping their relative positions

type ArrayOfParts = {[number]: BasePart} -- Parts inside this array are excluded from size or position changes

local Resize = {}

function Resize.SetSize(Model: Model, TargetSize: Vector3, DontAffectSize: ArrayOfParts?, DontAffectPosition: ArrayOfParts?)
	local PrimaryPart: BasePart? = Model.PrimaryPart
	if PrimaryPart then
		local PrimaryPartCFrame: CFrame = PrimaryPart.CFrame
		local SizeMultiplier: number = TargetSize / PrimaryPart.Size
		for _, Part: BasePart in pairs(Model:GetDescendants()) do
			if Part:IsA("BasePart") then
				if DontAffectSize == nil or not table.find(DontAffectSize, Part) then
					Part.Size *= SizeMultiplier
				end
				if Part ~= PrimaryPart and (DontAffectPosition == nil or not table.find(DontAffectPosition, Part)) then
					local Distance: Vector3 = Part.Position - PrimaryPartCFrame.Position
					local Rotation: CFrame = Part.CFrame - Part.Position
					Part.CFrame = (CFrame.new(PrimaryPartCFrame.Position + Distance * SizeMultiplier) * Rotation)
				end
			end
		end
	else
		error("Model needs a primary part to be resized.")
	end
end

function Resize.IncrementSize(Model: Model, Size: Vector3, DontAffectSize: ArrayOfParts?, DontAffectPosition: ArrayOfParts?)
	local PrimaryPart: BasePart? = Model.PrimaryPart
	Resize.SetSize(Model, PrimaryPart.Size + Size, DontAffectSize, DontAffectPosition)
end

function Resize.DecreaseSize(Model: Model, Size: Vector3, DontAffectSize: ArrayOfParts?, DontAffectPosition: ArrayOfParts?)
	local PrimaryPart: BasePart? = Model.PrimaryPart
	Resize.SetSize(Model, PrimaryPart.Size - Size, DontAffectSize, DontAffectPosition)
end

function Resize.MultiplySize(Model: Model, Size: Vector3, DontAffectSize: ArrayOfParts?, DontAffectPosition: ArrayOfParts?)
	local PrimaryPart: BasePart? = Model.PrimaryPart
	Resize.SetSize(Model, PrimaryPart.Size * Size, DontAffectSize, DontAffectPosition)
end

function Resize.DivideSize(Model: Model, Size: Vector3, DontAffectSize: ArrayOfParts?, DontAffectPosition: ArrayOfParts?)
	local PrimaryPart: BasePart? = Model.PrimaryPart
	Resize.SetSize(Model, PrimaryPart.Size / Size, DontAffectSize, DontAffectPosition)
end

return Resize