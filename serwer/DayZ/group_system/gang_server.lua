invitations = {}

addEventHandler("onResourceStart", resourceRoot, function()
	local columnName = get("column_name")
	executeSQLCreateTable("gangs", "gang_name STRING, gang_leader STRING, gang_members, gang_subleaders STRING")
	executeSQLCreateTable("gang_members", "gang_name STRING, member_account STRING, added_by STRING")
	checkPlayerGroupDetails()	
	for index, player in ipairs(getElementsByType("player")) do
		local gang = getAccountGang(getAccountName(getPlayerAccount(player)))
		setElementData(player, "gang", gang)
		--bindKey(player, get("panel_bind"), "down", showGangPanel)
	end
end)

addEventHandler("onPlayerLogin", root, function(_, account)
	local gang = getAccountGang(getAccountName(account))
	setElementData(source, "gang", gang)
	--bindKey(source, "U", "down", showGangPanel)
end)

function showGangPanel(thePlayer)
	local gangName = getElementData(thePlayer, "gang")
	if gangName ~= "Brak" then
		local memberList = getGangMembers(gangName)
		triggerClientEvent(thePlayer, "gangSystem:openGangPanel", thePlayer, memberList)
	end
end

--disabled
addCommandHandler(get("gang_list_command"), function(thePlayer)
	local gangList = getGangList()
		if gangList and #gangList > 0 then
		triggerClientEvent(thePlayer, "gangSystem:openGangList", thePlayer, gangList)
	end
end)

addEvent("gangSystem:invitePlayer", true)
addEventHandler("gangSystem:invitePlayer", root, function(playerName)
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	local player = getPlayerFromNamePart(playerName)
	if getGangLeader(gangName) == accountName or isGangSubLeader(gangName, accountName) then
		if player and isElement(player) then
			local playerAccountName = getAccountName(getPlayerAccount(player))
			if getAccountGang(gangName, playerAccountName) == "Brak" then
				invitations[player] = {gangName, source}
				outputChatBox("System grup: Zaprosiłeś " .. getPlayerName(player) .. " do grupy.", source, 0, 255, 0)
				outputChatBox("System grup: Zostałeś zaproszony do grupy " .. gangName .. ", naciśnij F1 i akceptuj.", player, 0, 255, 0)
            else
				outputChatBox("System grup: Ten gracz jest już w grupie!", source, 255, 0, 0)
			end
		else
			outputChatBox("System grup: " .. playerName .. " mecze bez graczy!", source, 255, 0, 0)
		end
	else
		outputChatBox("System grup: Nie wolno korzystać z tej funkcji.", source, 255, 0, 0)
	end
end)

--disabled see groupsystem.lua
addCommandHandler(get("gang_create_command"), function(thePlayer, command, ...)
	local accountName = getAccountName(getPlayerAccount(thePlayer))
	local gangName = table.concat({...}, " ")
	if gangName and gangName ~= "" then
		local added, errorMsg = addGang(gangName, accountName)
		if added then
			outputChatBox("Grupa gotowa: nazwa grupy: " .. gangName .. "!", thePlayer, 0, 255, 0)
        else
            outputChatBox("Błąd grupy " .. errorMsg .. "!", thePlayer, 255, 0, 0)
		end
	end
end)

addEvent("gangSystem:kickMember", true)
addEventHandler("gangSystem:kickMember", root, function(memberAccount)
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	if gangName ~= "Brak" then
		if getGangLeader(gangName) == accountName or isGangSubLeader(gangName, accountName) then
			if getGangLeader(gangName) ~= memberAccount then
				if removeGangMember(gangName, memberAccount, getPlayerName(source)) then
					outputChatBox("System grup: Wyrzuciłeś " .. memberAccount .. " z grupy.", source, 255, 50, 0)
                end
            else
                outputChatBox("System grup: Nie możesz wyrzucić lidera.", source, 255, 0, 0)
            end
        else
            outputChatBox("System grup: Nie możesz użyć tej funkcji.", source, 255, 0, 0)
		end
	end
end)

addEvent("gangSystem:leaveGang", true)
addEventHandler("gangSystem:leaveGang", root, function()
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	if gangName ~= "Brak" and accountName ~= "Guest" then
		if getGangLeader(gangName) ~= accountName then
			if removeGangMember(gangName, accountName) then
				outputChatBox("System grup: Opuściłeś " .. gangName .. ".", source, 255, 50, 0)
            end
        else
            outputChatBox("System grup: Nie pożesz opuśćić grupy gdy jesteś liderem!", source, 255, 0, 0)
		end
	end
end)

addEvent("gangSystem:destroyGang", true)
addEventHandler("gangSystem:destroyGang", root, function()
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	if gangName ~= "Brak" and accountName ~= "Guest" then
		if getGangLeader(gangName) == accountName then
			if removeGang(gangName) then
				outputChatBox("System grup: Usunąłeś grupę " .. gangName .. ".", source, 255, 50, 0)
            end
        else
            outputChatBox("System grup: Nie możesz użyć tej funkcji.", source, 255, 0, 0)
		end
	end
end)

addCommandHandler("accept", function(thePlayer)
	local invited, theGang, inviter = isPlayerGangInvited(thePlayer)
	if invited then
		addGangMember(theGang, getAccountName(getPlayerAccount(thePlayer)), getAccountName(getPlayerAccount(inviter)))
		outputChatBox("System grup: Witamy w grupie " .. tostring(theGang) .. "!", thePlayer, 0, 255, 0)
		for index, player in pairs(getPlayersByGang(theGang)) do
			outputChatBox("System grup: " .. getPlayerName(thePlayer) .. " dołączył do grupy!", player, 0, 255, 0)
		end
		invitations[thePlayer] = false
	end
end)

addEvent("onPlayerJoinGang", true)
addEventHandler("onPlayerJoinGang", root, function(gangName)
	if doesGangExists(gangName) then
		executeSQLUpdate("gangs", "gang_members = '" .. #getGangMembers(gangName) + 1 .. "'", "gang_name = '" .. tostring(gangName) .. "'")
	end
end)

addEvent("onPlayerLeaveGang", true)
addEventHandler("onPlayerLeaveGang", root, function(gangName)
	if doesGangExists(gangName) then
		executeSQLUpdate("gangs", "gang_members = '" .. #getGangMembers(gangName) - 1 .. "'", "gang_name = '" .. tostring(gangName) .. "'")
	end
end)

addEvent("gangSystem:getSubLeaders", true)
addEventHandler("gangSystem:getSubLeaders", root, function()
	local gangName = getElementData(source, "gang")
	if gangName and gangName ~= "Brak" then
		local subLeaders = getGangSubLeaders(gangName)
		triggerClientEvent(source, "gangSystem:returnSubLeaders", source, subLeaders)
	end
end)

addEvent("gangSystem:addSubLeader", true)
addEventHandler("gangSystem:addSubLeader", root, function(memberAccount)
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	if gangName ~= "Brak" and accountName ~= "Guest" then
		if getGangLeader(gangName) == accountName then
			local isSubLeader, errorMsg = isGangSubLeader(gangName, memberAccount)
			if not isSubLeader then
				if editGangSubLeaders(gangName, memberAccount, true) then
					outputChatBox("System grup: Dodałeś " .. memberAccount .. " na stanowisko sub-lidera.", source, 0, 255, 0)
                else
                    outputChatBox("System grup: " .. tostring(errorMsg), source, 255, 50, 0)
                end
            else
                outputChatBox("System grup: Ten gracz jest już sub-liderem.", source, 255, 50, 0)
            end
        else
            outputChatBox("System grup: Nie możesz użyć tej funkcji.", source, 255, 0, 0)
		end
	end
end)

addEvent("gangSystem:removeSubLeader", true)
addEventHandler("gangSystem:removeSubLeader", root, function(memberAccount)
	local gangName = getElementData(source, "gang")
	local accountName = getAccountName(getPlayerAccount(source))
	if gangName ~= "Brak" and accountName ~= "Guest" then
		if getGangLeader(gangName) == accountName then
			local isSubLeader, errorMsg = isGangSubLeader(gangName, memberAccount)
			if isSubLeader then
				if editGangSubLeaders(gangName, memberAccount, false) then
					triggerEvent("gangSystem:getSubLeaders", source)
					outputChatBox("System grup: Usunąłeś " .. memberAccount .. " ze stanowiska sub-lidera.", source, 255, 50, 0)
                else
                    outputChatBox("System grup: " .. tostring(errorMsg), source, 255, 50, 0)
                end
            else
                outputChatBox("System grup: " .. tostring(errorMsg), source, 255, 50, 0)
            end
        else
            outputChatBox("System grup: Nie możesz użyć tej funkcji.", source, 255, 0, 0)
		end
	end
end)
