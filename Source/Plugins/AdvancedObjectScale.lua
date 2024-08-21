--[[

Script Type : Module
Script Name : AdvancedObjectScale

]]--

local AdvancedObjectScale = {}

function AdvancedObjectScale:ScaleFaceTween(Instance1, Face1, DeltaSize1, TweenInfo1)
	local Axis = Enum.Axis[Face1.Name]
	local Props = {
		Size = Instance1.Size + Vector3.FromAxis(Axis)*DeltaSize1,
		CFrame = Instance1.CFrame * CFrame.new(Vector3.FromNormalId(Face1)*DeltaSize1/2)
	}
	local Tween = game:GetService("TweenService"):Create(Instance1, TweenInfo1, Props)
	return Tween
end

return AdvancedObjectScale