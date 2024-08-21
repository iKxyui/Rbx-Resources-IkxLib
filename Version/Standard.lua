--[[

Script Type : Module
Script Name : Standard

]]--

--[=[

[AdvancedObjectScale]
AdvancedObjectScale:ScaleFaceTween - Used to scale only one side of an Objects Axis

[ApplyImpulse]
ApplyImpulse:SetCurve - Used to move objects with a curvature
	Example:
		local APProperties = {
		["Parent"] = Character;
		["DestroyOnContact"] = true;
		["Gravity"] = 30; -- Set nil to use the games current gravity
		["Duration"] = 1;
		["Offsets"] = {
			["Start"] = Character.HumanoidRootPart.CFrame * CFrame.new(0,0.5,-4);
			["End"] = Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-15);
		};
		}
		ApplyImpulse:SetCurve(APProperties)

[Debris2]
Open Source module created by Kitsune

[EasingStyles]
Module Library of core easing styles

[EnumDebug]
EnumDebug:GetEnumFromValue - Gets the Enum Item from a value

[MaterialDecode]
MaterialDecode:SetMaterialToString - Turns the Enum Material into a string

[MathFunctions]
MaterialDecode:RoundNumber - Rounds and integer to a set number of decimal places

[RemoteInvoke]
RemoteInvoke:InvokeAllClients - Uses the same functionality as Remote:FireAllClients() instead uses the Instance RemoteFunction as the first argument/parameter

[Resize]
Increases, Decreases, Divides, and Multiplies Objects in a Model Group

[Services]
Gets a service using MonoBehavior (Eliminates the use of "game:GetService" over and over)

[TimeService]
TimeService.OS:SetDelay - Uses Operating System (OS) to measure the delay timer
TimeService.RS:SetDelay - Uses Client Hardware to measure the delay timer

[Tools]
Tools:SetModule - Sets a module with its additional arguments in place
Tools:ApplyFunctionToObjectGroup - Sets a function to a group of objects in a table, returns the object found in the search loop
	Search Arguments: Name, IsA, Tag
	Example:
	Tools:ApplyFunctionToObjectGroup(workspace,{Name = "Baseplate";},function(Obj)
		print("works")
		Obj:Destroy()
	end)

[Settings]
Settings.Directory - Sets Directory for the Plugins Folder
Settings.TimeServiceMeasurement - Sets the measurement type of delay that Plugins.TimeService will use (Seconds or Frames)

-]=]

return "Standard.lua"