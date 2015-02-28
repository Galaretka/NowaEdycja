local root = getRootElement()
addEventHandler("onPlayerLogin", root, function()
  triggerClientEvent("onRollMessageStart", getRootElement(), getPlayerName(source) .. " #FFFFFFzalogował się!", 255, 255, 255, "join")
end)
