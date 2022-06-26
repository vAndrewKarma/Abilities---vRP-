local Tunnel <const> = module("vrp", "lib/Tunnel")
local Proxy <const> = module("vrp", "lib/Proxy")
local vRPclient <const> = Tunnel.getInterface('vRP', 'vRP')
local vRP <const> = Proxy.getInterface('vRP')
mortiimei = {}
vrp_pictor = {}
local damrefresh = {}
setmetatable(damrefresh, {
	__call = function(...)
		-- o sa schimb partea asta oleak cand am timp sa functioneze altcumva
		local loadFile = LoadResourceFile(GetCurrentResourceName(), "./info.json")
		mortiimei = json.decode(loadFile) 
return mortiimei;
	end
})
local pictor <const> = {__call = function()
	karmaandrew = {
		iq = 10, putere  = 10, 
		craftinglevel  = 10,
		metatableuplm= {},
		nou=  function()
		local plm = {}
		setmetatable(plm, karmaandrew.metatableuplm)
		return plm 
		end
		}
		karmaandrew.metatableuplm.__index = karmaandrew
		karmaandrew.metatableuplm.__metatable = "i voul iu"
		playerbasic = karmaandrew.nou()
		AddEventHandler('onResourceStart', function() damrefresh() end)
end}
setmetatable(vrp_pictor, pictor)
vrp_pictor()
AddEventHandler("vRP:playerSpawn", function(uid,source)
	if uid == nil then return end
	damrefresh()
		local fmmcoaie = ({id = uid, iq =playerbasic.iq ,putere =playerbasic.putere , craftinglevel =playerbasic.craftinglevel })
		for ___,v in pairs(mortiimei) do
			if v.id == uid then
				return
			end
		end
		table.insert(mortiimei, fmmcoaie)
		SaveResourceFile(GetCurrentResourceName(), "info.json", json.encode(mortiimei), -1)
end)
