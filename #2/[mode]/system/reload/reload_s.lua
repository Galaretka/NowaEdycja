function forceReload(p)
	reloadPedWeapon (p)
end
addCommandHandler("Reload weapon",forceReload)

function bindPlayerReloadKey(p)
	bindKey(p,"r","down","Reload weapon")
end

function bindReloadForAllPlayers()
	for k,v in ipairs(getElementsByType("player")) do
		bindPlayerReloadKey(v)
	end
end

addEvent("onPlayerReload",true)
addEventHandler("onPlayerReload",getRootElement(),function()
	reloadPedWeapon(source)
end)