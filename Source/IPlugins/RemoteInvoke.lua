--[[

Script Type : Module
Script Name : RemoteInvoke

]]--

local RemoteInvoke = {}

function RemoteInvoke:InvokeAllClients(RemoteInstance,Arg01,Arg02,Arg03,Arg04,Arg05,Arg06,Arg07,Arg08,Arg09)
	task.spawn(function()
		for _,GetPlayerObj in pairs(game:GetService("Players"):GetPlayers()) do
			task.spawn(function()
				pcall(function()
					return RemoteInstance:InvokeClient(GetPlayerObj,Arg01,Arg02,Arg03,Arg04,Arg05,Arg06,Arg07,Arg08,Arg09)
				end)
			end)
		end
	end)
end

return RemoteInvoke