local hud = {"ammo","area_name","armour","breath","clock","health","radar","money","vehicle_name","weapon","radio","wanted"}

function showHud()
	setPlayerNametagShowing(source, false)
	for _,show in ipairs(hud) do
		showPlayerHudComponent(source, show, false)
	end
end
addEventHandler("onPlayerJoin", getRootElement(), showHud)