local Tunnel <const> = module("vrp", "lib/Tunnel")
local Proxy <const> = module("vrp", "lib/Proxy")
local vRPclient <const> = Tunnel.getInterface('vRP', 'vRP')
local vRP <const> = Proxy.getInterface('vRP')
refreshingtbl = {}
vrp_abilitati = {}
local refresh = {}
setmetatable(refresh, {
	__call = function(...)
		local loadFile = LoadResourceFile(GetCurrentResourceName(), "./info.json")
		refreshingtbl = json.decode(loadFile) 
return refreshingtbl;
	end
})
local abilitati <const> = {__call = function()
	testing = {
		iq = 10, putere  = 10, 
		craftinglevel  = 10,
		themetatable= {},
		nou=  function()
		local table_test = {}
		setmetatable(table_test, testing.themetatable)
		return table_test 
		end
		}
		testing.themetatable.__index = testing
		testing.themetatable.__metatable = "ignore"
		playerbasic = testing.nou()
		AddEventHandler('onResourceStart', function() refresh() end)
end}
setmetatable(vrp_abilitati, abilitati)
vrp_abilitati()
AddEventHandler("vRP:playerSpawn", function(uid,source)
	if uid == nil then return end
	refresh()
		local ignore_pls = ({id = uid, iq =playerbasic.iq ,putere =playerbasic.putere , craftinglevel =playerbasic.craftinglevel })
		for ___,v in pairs(refreshingtbl) do
			if v.id == uid then
				return
			end
		end
		table.insert(refreshingtbl, ignore_pls)
		SaveResourceFile(GetCurrentResourceName(), "info.json", json.encode(refreshingtbl), -1)
end)
