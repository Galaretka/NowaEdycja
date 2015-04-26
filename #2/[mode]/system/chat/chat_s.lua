function globalMessage(thePlayer, cmd, ...)
    local message = table.concat ( { ... }, " " )
	local name = getPlayerName(thePlayer)
	if isPlayerMuted ( thePlayer ) then
		outputChatBox ("Jesteś uciszony!", thePlayer, 255, 128, 22, true)
		return
	end
	outputChatBox("#A52A2A"..name..": #FFF5EE"..message, getRootElement(), 255, 255, 255, true)
	outputServerLog("[CHAT]"..getPlayerName(thePlayer)..": "..message)
end
addCommandHandler("GlobalChat", globalMessage)

function pmsgAdmin(playersource, command, ...)
	local msg = table.concat({...}, " ")
	if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")) then
		outputChatBox("#FFF5EE[Admin]"..getPlayerName(playersource) .. ":#A52A2A " .. msg, getRootElement(), 60, 200, 40, true)
	end
end
addCommandHandler("AdminChat", pmsgAdmin)