--[[
addGang - Arguments: gangName, gangLeader. Returns: true or false.
removeGang - Arguments: gangName. Returns: true or false.
doesGangExists - Arguments: gangName. Returns: true or false.
getGangList - Arguments: None. Returns: A table with gang list.
getGangMembers - Arguments: gangName. Returns: A table with gang members.
addGangMember - Arguments: gangName, accountName, addedBy. Returns: true or false (if false, it'll return a second argument with the error.).
removeGangMember - Arguments: gangName, accountName, kickerName (if used it'll output who kicked the member, else it'll output that you left).
isGangMember - Arguments: gangName, accountName. Returns: true or false.
getAccountGang - Arguments: accountName. Returns: The gang name, 'None' otherwise.
getGangLeader - Arguments: gangName. Returns: The gang leader.
getGangSubLeaders - Arguments: gangName. Returns: A JSON string with gang sub leaders.
isPlayerGangInvited - Arguments: thePlayer. Returns: 3 arguments: invited, gangName, inviter.
getPlayersByGang - Arguments: gangName. Returns: A table with gang players.
isGangSubLeader - Arguments: gangName, accountName. Returns: true or false.
]]

function getGangSlots (gangname)
	local account = getAccount(getGangLeader(gangname))
	if account then
		return (getAccountData(account,"gangslots") or 0)
	else
		return 12
	end
end

function checkPlayerGroupDetails ()
	gangtable = {}
	local gangtablename = getGangList()
	for i,group in pairs(gangtablename) do
		local gangtablemembers = #getGangMembers(group["gang_name"])
		local groupleader = getGangLeader(group["gang_name"])
		local gangvip = getGangSlots (group["gang_name"])
		table.insert(gangtable,{group["gang_name"],groupleader,gangtablemembers,gangvip})	
	end	
	--setElementData(getRootElement(),"ganglist",gangtable)
end
setTimer(checkPlayerGroupDetails,120000,0)

playerTeam = createTeam ("Player")
function updateGangTable()
	--setElementData(getRootElement(),"ganglist",gangtable)
	setPlayerTeam(source,playerTeam)
end
addEventHandler("onPlayerJoin",getRootElement(),updateGangTable)

function groupChat( message, messageType )
	cancelEvent()
    if (messageType == 2) then
		if getElementData(source,"gang") == "Brak" then return end
		if not doesGangExists(getElementData(source,"gang")) then return end
		for i, player in ipairs(getPlayersByGang(getElementData(source,"gang"))) do
			if getElementData(player,"gang") == "Brak" then break end
			if getElementData(player,"gang") == getElementData(source,"gang") then
				outputChatBox("[Группа]"..getPlayerName(source)..": "..message,player,255,255,255,true)
			end	
		end
	end	
end
addEventHandler( "onPlayerChat", getRootElement(), groupChat )

function refreshClientGangList()
	triggerClientEvent(source, "refreshGangListToClient", source, gangtable)
end
addEvent("refreshClientGangList",true)
addEventHandler("refreshClientGangList",getRootElement(),refreshClientGangList)

function refreshPlayerGangMemberList ()
	local gangmembertable = {}
	local account = getPlayerAccount(source)
	local gang = getAccountGang(getAccountName(account))
	if gang == "Brak" then return end
	for i,gangmember in pairs(getGangMembers(gang)) do
		local groupleader = getGangLeader(gang)
		gangleader = false
		if gangmember["member_account"] == groupleader then
			gangleader = true
		end
		logedin = false
		if getAccountPlayer(getAccount(gangmember["member_account"])) then
			logedin = true
			player = getAccountPlayer(getAccount(gangmember["member_account"]))
		end
		table.insert(gangmembertable,{gangmember["member_account"],gangleader,logedin,player})	
	end	
	triggerClientEvent(source, "refreshGangMemberTableToClient", source, gangmembertable)
end
addEvent("refreshPlayerGangMemberList",true)
addEventHandler("refreshPlayerGangMemberList",getRootElement(),refreshPlayerGangMemberList)

function refreshPlayerInvite ()
	invited,gangName,inviter = isPlayerGangInvited(source)
	if invited then
		if not getElementData(source,"gang") == "Brak" then return end
		local gangmember = #getGangMembers(gangName)
		local gangvip = getGangSlots (gangName)
		triggerClientEvent(source,"updatePlayerInvites",source,gangName,getPlayerName(inviter),gangmember,gangvip)
	end
end
addEvent("refreshPlayerInvite",true)
addEventHandler("refreshPlayerInvite",getRootElement(),refreshPlayerInvite)

--Gui Triggers
function acceptGroupInvite ()
	invited,gangName,inviter = isPlayerGangInvited(source)
	if invited then
		if #getGangMembers(getElementData(inviter,"gang"))+1 > getGangSlots(getElementData(inviter,"gang")) then outputChatBox(getPlayerName(source)..", #22ff22This group is full!",source,22,255,22,true) return end
		addGangMember(gangName,getAccountName(getPlayerAccount(source)),"Лидер")
		outputChatBox(getPlayerName(source).." #22ff22Присоединился к группе "..gangName.."!",getRootElement(),22,255,22,true)
	end
end
addEvent("acceptGroupInvite",true)
addEventHandler("acceptGroupInvite",getRootElement(),acceptGroupInvite)

function destroyGroup ()
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then
		for i,gangmember in pairs(getGangMembers(getElementData(source,"gang"))) do
			removeGangMember(getAccountGang(getAccount(gangmember["member_account"])),gangmember["member_account"])
		end
		outputChatBox(getPlayerName(source).." #22ff22Удалил группу: "..getElementData(source,"gang").."!",getRootElement(),22,255,22,true)
		removeGang(getAccountGang(getAccountName(getPlayerAccount(source))))
	else
		outputChatBox(getPlayerName(source)..", #22ff22Вы не можете удалить эту группу!",source,22,255,22,true)
	end
end
addEvent("destroyGroup",true)
addEventHandler("destroyGroup",getRootElement(),destroyGroup)

function leaveGroup ()
	if getElementData(source,"gang") == "Brak" then return end
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then outputChatBox(getPlayerName(source)..",#22ff22Вы не можете покинуть свою собственную группу!",source,22,255,22,true) return end
	outputChatBox(getPlayerName(source).." #22ff22Покинул группу: "..getElementData(source,"gang").."!" ,getRootElement(),22,255,22,true)
	removeGangMember(getAccountGang(getAccountName(getPlayerAccount(source))),getAccountName(getPlayerAccount(source)))
end
addEvent("leaveGroup",true)
addEventHandler("leaveGroup",getRootElement(),leaveGroup)

function kickGroupMember (playerName)
	if getElementData(source,"gang") == "Brak" then return end
	if string.find(playerName,"(Лидер)") then return end
	--if getPlayerName(source) == playerName then return end
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader or isGangSubLeader(getElementData(source,"gang"),getAccountName(getPlayerAccount(source))) then
		outputChatBox(playerName.." #22ff22Изгнан из "..getElementData(source,"gang").."!",getRootElement(),22,255,22,true)
		removeGangMember(getElementData(source,"gang"),playerName,getPlayerName(source))
	else
		outputChatBox(getPlayerName(source)..",#22ff22Вы не можете выгнать выживших!",source,22,255,22,true)
	end
end
addEvent("kickGroupMember",true)
addEventHandler("kickGroupMember",getRootElement(),kickGroupMember)

function addGroupSubLeader (playerName)
	if getElementData(source,"gang") == "Brak" then return end
	if string.find(playerName,"(Лидер)") then return end
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then
		if not getAccountPlayer(getAccount(playerName)) then outputChatBox(playerName.." #22ff22Выживший должен быть online!",source,22,255,22,true) return end
		triggerEvent ( "gangSystem:addSubLeader", source, getPlayerName(getAccountPlayer(getAccount(playerName))) )
		outputChatBox(playerName.." #22ff22Является зам лидера!",source,22,255,22,true)
		outputChatBox("В настоящее время зам лидера!",getAccountPlayer(getAccount(playerName)),22,255,22,true)
	else
		outputChatBox(getPlayerName(source)..",#22ff22Вы не лидер группы!",source,22,255,22,true)
	end
end
addEvent("addGroupSubLeader",true)
addEventHandler("addGroupSubLeader",getRootElement(),addGroupSubLeader)

function removeGroupSubLeader (playerName)
	if getElementData(source,"gang") == "Brak" then return end
	if string.find(playerName,"(Лидер)") then return end
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then
		if not getAccountPlayer(getAccount(playerName)) then outputChatBox(playerName..", #22ff22Выживший должен быть online!",source,22,255,22,true) return end
		if isGangSubLeader(getElementData(source,"team"),playerName) then
			triggerEvent ( "gangSystem:removeSubLeader", source, getPlayerName(getAccountPlayer(getAccount(playerName))) )
			outputChatBox(playerName..", #22ff22Нету зам лидера!",source,22,255,22,true)
		else	
			outputChatBox(playerName..", #22ff22Нету зам лидера!",source,22,255,22,true)
		end	
	else
		outputChatBox(getPlayerName(source).." #22ff22Вы не лидер группы!",source,22,255,22,true)
	end
end
addEvent("removeGroupSubLeader",true)
addEventHandler("removeGroupSubLeader",getRootElement(),removeGroupSubLeader)

function invitePlayerToGroup (playerName)
	if getElementData(source,"gang") == "Brak" then return end
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then
		if #getGangMembers(getElementData(source,"gang"))+1 < getGangSlots(getElementData(source,"gang")) then
		if not getPlayerFromName(playerName) == false then
			if getElementData(getPlayerFromName(playerName),"gang") == "Brak" then
				triggerEvent ( "gangSystem:invitePlayer", source, playerName )
			else
				outputChatBox(playerName.." #22ff22Находится уже в группе!",source,22,255,22,true)
			end	
		else
			outputChatBox(playerName.."#22ff22Выживший должен быть online!",source,22,255,22,true)
		end
		else
			outputChatBox(getPlayerName(source)..", #22ff22Группа полная!",source,22,255,22,true)
		end
	else
		outputChatBox(getPlayerName(source)..", #22ff22Вы должны быть лидером этой группы!",source,22,255,22,true)
	end
end
addEvent("invitePlayerToGroup",true)
addEventHandler("invitePlayerToGroup",getRootElement(),invitePlayerToGroup)

function gangcreateCommandHandler (cmd)
	if cmd == "creategang" then
		cancelEvent()
	elseif cmd == "accept" then
		cancelEvent()
		outputChatBox("Нажмите F1 чтобы принять приглашение группе!",source,255,255,255,true)
	elseif cmd == "gangs" then
		cancelEvent()
	end
end
addEventHandler("onPlayerCommand",getRootElement(),gangcreateCommandHandler)

function isGangExisting (gangname)
	for i,group in pairs(getGangList()) do
		if group["gang_name"] == gangname then 
			return true
		end
	end
	return false
end

function createGroupForPlayer (playersource,command,...)
	local teamName = table.concat({...}, " ")
	if not isGuestAccount(getPlayerAccount(playersource)) and getElementData(playersource,"gang") == "Brak" then
		if teamName then
			if not isGangExisting (teamName) then
			addGang (teamName,getAccountName(getPlayerAccount(playersource)))
			setAccountData(getPlayerAccount(playersource),"gangslots",12)
			outputChatBox ("#FFFFFFВы успешно создали группу: "..teamName..".",playersource,27, 89, 224,true)	
			else
				outputChatBox ("#FFFFFFГруппа уже создана с таким названием!",playersource,27, 89, 224,true)	
			end
		else
			outputChatBox ("#FFFFFFЧтобы создать группу введите /creategroup <name>!",playersource,27, 89, 224,true)	
		end
	else
		outputChatBox ("#FFFFFFВы уже находитесь в группе!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("creategroup",createGroupForPlayer)

function setGroupVIP (playersource,command,targetString,moreSlots)
	if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")))  then
		if getAccount(targetString) then
			local oldData = getAccountData(getAccount(targetString),"gangslots") or 0
			setAccountData(getAccount(targetString),"gangslots",oldData+moreSlots)
			outputChatBox(targetString.."'s group has now VIP status - new amount of slots: "..getAccountData(getAccount(targetString),"gangslots").." Slots.",getRootElement(),22,255,22,true)
		end
	else
		outputChatBox ("#FFFFFFТы не администратор!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("givevip",setGroupVIP)
