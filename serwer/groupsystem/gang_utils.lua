﻿function addGang(gangName, gangLeader)
	if not doesGangExists(gangName) then
		if executeSQLInsert("gangs", "'" .. tostring(gangName) .. "','" .. tostring(gangLeader) .. "','0','[ ]'") then
			outputDebugString("System grup: Stworzono grupę o nazwie: " .. tostring(gangName) .. ", lider: " .. tostring(gangLeader))
			addGangMember(gangName, gangLeader, "System")
			return true
		else
			return false, "Wystąpił błąd."
		end
	else
		return false, "Grupa już istnieje."
	end
end

function removeGang(gangName)
	if executeSQLDelete("gangs", "gang_name = '" .. tostring(gangName) .. "'") then
		for index, member in ipairs(executeSQLQuery("SELECT * FROM gang_members WHERE gang_name = '" .. tostring(gangName) .. "'")) do
			removeGangMember(gangName, member.member_account)
		end
		return true
	else
		return false, "Wystąpił błąd."
	end
end

function doesGangExists(gangName)
	local check = executeSQLSelect("gangs", "*", "gang_name = '" .. tostring(gangName) .. "'")
	if type(check) == "table" and #check == 0 or not check then
		return false
	else
		return true
	end
end

function getGangList()
	local data = executeSQLQuery("SELECT * FROM gangs")
	return data
end

function getGangMembers(gangName)
	if doesGangExists(gangName) then
		local data = executeSQLQuery("SELECT * FROM gang_members WHERE gang_name = '" .. tostring(gangName) .. "'")
		return data
	else
		return false, "Grupa nie istnieje."
	end
end

function addGangMember(gangName, memberAccount, addedBy)
	if not doesGangExists(gangName) then
		return false, "Grupa nie istnieje."
	end
	if isGangMember(gangName, memberAccount) then
		return false, "Ten użytkownik jest już w grupie."
	end
	if executeSQLInsert("gang_members", "'" .. tostring(gangName) .. "','" .. tostring(memberAccount) .. "','" .. tostring(addedBy) .. "'") then
		local account = getAccount(memberAccount)
		if account and getAccountPlayer(account) then
			setElementData(getAccountPlayer(account), "gang", gangName)
			setTimer(triggerEvent, 200, 1, "onPlayerJoinGang", getAccountPlayer(account), gangName)
		end
		outputDebugString("System grup: Użytkownik dodany do: " .. tostring(gangName) .. ", konto: " .. tostring(memberAccount))
		return true
	else
		return false, "Wystąpił błąd."
	end
end

function removeGangMember(gangName, memberAccount, kickerName)
	if executeSQLDelete("gang_members", "member_account = '" .. tostring(memberAccount) .. "' AND gang_name = '" .. tostring(gangName) .. "'") then
		local account = getAccount(memberAccount)
		if account and not isGuestAccount(account) then
			local player = getAccountPlayer(account)
			if player then
				if player and kickerName then
					outputChatBox("System grup: Zostałeś wyrzucony z grupy " .. tostring(gangName) .. " przez " .. tostring(kickerName) .. ".", player, 255, 0, 0)
                else
                    outputChatBox("System grup: Opuściłeś " .. tostring(gangName) .. ".", player, 255, 0, 0)
				end
				setTimer(triggerEvent, 200, 1, "onPlayerLeaveGang", player, gangName)
				setElementData(player, "gang", "Brak")
			else
				triggerEvent("onPlayerLeaveGang", memberAccount, gangName)
			end
		end
		return true
	else
		return false, "Wystąpił błąd."
	end
end

function isGangMember(gangName, memberAccount)
	if doesGangExists(gangName) then
		local check = executeSQLSelect("gang_members", "*", "gang_name = '" .. tostring(gangName) .. "' AND member_account = '" .. tostring(memberAccount) .. "'")
		if type(check) == "table" and #check == 0 or not check then
			return false, "Członek nie istnieje."
		else
			return true
		end
	else
		return false, "Grupa nie istnieje."
	end
end

function getAccountGang(memberAccount)
	local check = executeSQLSelect("gang_members", "*", "member_account = '" .. tostring(memberAccount) .. "'")
	if type(check) == "table" and #check == 0 or not check then
		return "Brak"
	else
		return tostring(check[1].gang_name)
	end
end

function getGangLeader(gangName)
	if doesGangExists(gangName) then
		local data = executeSQLQuery("SELECT gang_leader FROM gangs WHERE gang_name='" .. tostring(gangName) .. "'")
		return tostring(data[1].gang_leader)
	else
		return false, "Grupa nie istnieje."
	end
end

function editGangSubLeaders(gangName, memberAccount, addOrRemove)
	if doesGangExists(gangName) then
		local subLeaders = getGangSubLeaders(gangName)
		local sLeaders = {}
		if subLeaders and subLeaders ~= "[ ]" then
			for index, subLeader in ipairs(fromJSON(subLeaders)) do
				table.insert(sLeaders, subLeader)
			end
		end
		if not addOrRemove then
			for index, subLeader in ipairs(sLeaders) do
				if subLeader == memberAccount then
					table.remove(sLeaders, index)
				end
			end
		else
			table.insert(sLeaders, memberAccount)
		end
		return executeSQLUpdate("gangs", "gang_subleaders = '" .. toJSON(sLeaders) .. "'", "gang_name = '" .. gangName .. "'")
	else
		return false, "Grupa nie istnieje."
	end
end

function getGangSubLeaders(gangName)
	if doesGangExists(gangName) then
		local data = executeSQLQuery("SELECT gang_subleaders FROM gangs WHERE gang_name='" .. tostring(gangName) .. "'")
		return tostring(data[1].gang_subleaders)
	else
		return false, "Grupa nie istnieje."
	end
end

function isGangSubLeader(gangName, memberAccount)
	if doesGangExists(gangName) then
		local subLeaders = getGangSubLeaders(gangName)
		local isSubLeader = false
		if subLeaders and subLeaders == "[ ]" then
			return
		end
		for index, subLeader in ipairs(fromJSON(subLeaders)) do
			if subLeader == memberAccount then
				isSubLeader = true
			else
				isSubLeader = false
			end
		end
		if isSubLeader then
			return true
		else
			return false, "Ten użytkownik nie jest sub liderem."
		end
	else
		return false, "Grupa nie istnieje."
	end
end

function getPlayerFromNamePart(playerPart)
	local pl = getPlayerFromName(playerPart)
	if isElement(pl) then
		return pl
	else
		for i, v in ipairs(getElementsByType("player")) do
			if string.find(getPlayerName(v), playerPart) then
				return v
			end
		end
	end
end

function isPlayerGangInvited(thePlayer)
	if invitations[thePlayer] then
		return true, invitations[thePlayer][1], invitations[thePlayer][2]
	else
		return false
	end
end

function getPlayersByGang(gangName)
	local theTable = {}
	for index, player in pairs(getElementsByType("player")) do
		if getElementData(player, "gang") == tostring(gangName) then
			table.insert(theTable, player)
		end
	end
	return theTable
end
