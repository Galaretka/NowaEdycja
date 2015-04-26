local isFlon = {}
local isFlen = {}

function remotePlayerJoin()
	isFlon[source]=false
	isFlen[source]=false
	for _,playa in ipairs(getElementsByType("player")) do		
		triggerClientEvent (source,"flashOnPlayerEnable",getRootElement(),isFlen[playa],playa)
		triggerClientEvent (source,"flashOnPlayerSwitch",getRootElement(),isFlon[playa],playa)
	end
end
addEvent("onPlayerStartRes",true)
addEventHandler("onPlayerStartRes", getRootElement(), remotePlayerJoin)

function remotePlayerQuit()
	if getElementType ( source ) == "player" then
		isFlon[source]=false
		isFlen[source]=false
		triggerClientEvent ("flashOnPlayerQuit",getRootElement(),source)
	end
end
addEventHandler("onPlayerQuit", getRootElement(), remotePlayerQuit)

function remoteSwitch(isON)
	isFlon[source]=isON 
	triggerClientEvent ("flashOnPlayerSwitch",getRootElement(),isFlon[source],source)
end
addEvent("onSwitchLight",true)
addEventHandler("onSwitchLight", getRootElement(), remoteSwitch)

function remoteEnable(isEN)
	isFlen[source]=isEN 
	triggerClientEvent ("flashOnPlayerEnable",getRootElement(),isFlen[source],source)
end
addEvent("onSwitchEffect",true)
addEventHandler("onSwitchEffect", getRootElement(), remoteEnable)
 
function getPlayerInterior()
	local interior = getElementInterior(source)
	triggerClientEvent ("flashOnPlayerInter",getRootElement(),source,interior)
end
addEvent("onPlayerGetInter",true)
addEventHandler("onPlayerGetInter", getRootElement(), getPlayerInterior)