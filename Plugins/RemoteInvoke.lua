--[[

Script Type : Module
Script Name : RemoteInvoke

]]--

local RemoteInvoke = {}

function RemoteInvoke:InvokeAllClients(RemoteInstance,Var1,Var2,Var3,Var4,Var5,Var6,Var7,Var8,Var9,Var10)
	coroutine.resume(coroutine.create(function()
		for _,GetPlayerObj in pairs(game:GetService("Players"):GetPlayers()) do
			coroutine.resume(coroutine.create(function()
				pcall(function()
					return RemoteInstance:InvokeClient(GetPlayerObj,Var1,Var2,Var3,Var4,Var5,Var6,Var7,Var8,Var9,Var10)
				end)
				return GetPlayerObj
			end))
		end
	end))
end

return RemoteInvoke