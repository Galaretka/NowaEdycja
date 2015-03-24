local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
	function()
		triggerClientEvent ( "onRollMessageStart", getRootElement(), getPlayerName(source).." #0037FFавторизовался!",255,255,255, "join")
	end
)