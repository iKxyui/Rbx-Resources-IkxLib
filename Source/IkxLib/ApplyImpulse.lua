--[[

Script Type : Module
Script Name : ApplyImpulse

]]--

local ApplyImpulse = {
	Region3DirectoryCheck = workspace;
}

function ApplyImpulse:SetCurve(Parent,Object,Properties)
	Properties.Gravity = Properties.Gravity or workspace.Gravity
	Properties.DestroyOnContact = Properties.DestroyOnContact or false

	local SetPath = Instance.new("Model")
	SetPath.Name = "SetPath"
	SetPath.Parent = Parent

	local NodePart1 = Instance.new("Part")
	NodePart1.Name = "START"
	NodePart1.Anchored = true
	NodePart1.CanCollide = false
	NodePart1.CanTouch = false
	NodePart1.CanQuery = false
	NodePart1.Locked = true
	NodePart1.Massless = true
	NodePart1.Size = Vector3.new(0.5,0.5,0.5)
	NodePart1.Color = Color3.fromRGB(72,255,21)
	NodePart1.Material = Enum.Material.Neon
	NodePart1.Transparency = 1
	NodePart1.CFrame = Properties.Offsets.Start
	NodePart1.Parent = SetPath

	local NodePart2 = Instance.new("Part")
	NodePart2.Name = "END"
	NodePart2.Anchored = true
	NodePart2.CanCollide = false
	NodePart2.CanTouch = false
	NodePart2.CanQuery = false
	NodePart2.Locked = true
	NodePart2.Massless = true
	NodePart2.Size = Vector3.new(0.5,0.5,0.5)
	NodePart2.Color = Color3.fromRGB(255,10,26)
	NodePart2.Material = Enum.Material.Neon
	NodePart2.Transparency = 1
	NodePart2.CFrame = Properties.Offsets.End
	NodePart2.Parent = SetPath

	local PartToMove = Object

	local Pos1 = NodePart1.Position
	local Pos2 = NodePart2.Position

	local Direction = Pos2 - Pos1
	local Duration = Properties.Duration
	local Force = Direction / Duration + Vector3.new(0,Properties.Gravity * Duration,0)

	PartToMove:ApplyImpulse(Force * PartToMove.AssemblyMass)

	local EventFired = false

	local function EndPath()
		PartToMove:Destroy()
		SetPath:Destroy()
		NodePart1:Destroy()
		NodePart2:Destroy()
	end

	task.defer(function()
		if Properties.DestroyOnContact == true then return end
		while true do
			if EventFired == true then
				break
			end
			local TargetObj = PartToMove
			local Pos = TargetObj.Position
			local Size = TargetObj.Size/2
			local Region = Region3.new(Pos - Size, Pos + Size)
			local Ignore = {Parent}
			local Check = workspace:FindPartsInRegion3WithIgnoreList(Region,Ignore,math.huge)
			for i,v in pairs(Check) do
				if v:IsA("BasePart") and not v:IsAncestorOf(ApplyImpulse.Region3DirectoryCheck) then
					EventFired = true
					EndPath()
					break
				end
				if not v:IsDescendantOf(Parent) and v.CanTouch == true then
					EventFired = true
					EndPath()
					break
				end
			end
			if EventFired == true then
				break
			end
			game:GetService("RunService").Stepped:Wait()
		end
	end)
end

return ApplyImpulse