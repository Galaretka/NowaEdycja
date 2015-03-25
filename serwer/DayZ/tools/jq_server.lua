local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
	function()
		triggerClientEvent ( "onRollMessageStart", getRootElement(), getPlayerName(source).." #0037FFzalogował się!",255,255,255, "join")
	end
)