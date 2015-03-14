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

function checkPlayerGroupDetails()
	gangtable = {}
	local gangtablename = getGangList()
	for i,group in pairs(gangtablename) do
			local gangtablemembers = #getGangMembers(group["gang_name"])
			local groupleader = getGangLeader(group["gang_name"])
			local gangvip = getGangSlots (group["gang_name"])
			table.insert(gangtable,{group["gang_name"],groupleader,gangtablemembers,gangvip})	
	end	
	setElementData(getRootElement(),"ganglist",gangtable)
end
setTimer(checkPlayerGroupDetails,120000,0)
checkPlayerGroupDetails()

playerTeam = createTeam ("Player")
function updateGangTable()
	setElementData(getRootElement(),"ganglist",gangtable)
	setPlayerTeam(source,playerTeam)
end
addEventHandler("onPlayerJoin",getRootElement(),updateGangTable)

function groupChat( message, messageType )
cancelEvent()
    if (messageType == 2) then
			if getElementData(source,"gang") == "None" then return end
			if not doesGangExists(getElementData(source,"gang")) then return end
			for i, player in ipairs(getPlayersByGang(getElementData(source,"gang"))) do
				if getElementData(player,"gang") == "None" then break end
				if getElementData(player,"gang") == getElementData(source,"gang") then
					outputChatBox("[GRUPA]"..getPlayerName(source)..": "..message,player,9,249,17,true)
				end	
			end
	end	
end
addEventHandler( "onPlayerChat", getRootElement(), groupChat )


function refreshPlayerGangMemberList()
	local gangmembertable = {}
	local account = getPlayerAccount(source)
	local gang = getAccountGang(getAccountName(account))
	if gang == "None" then return end
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
	setElementData(getRootElement(),"gangmemberlist_"..gang,gangmembertable)
end
addEvent("refreshPlayerGangMemberList",true)
addEventHandler("refreshPlayerGangMemberList",getRootElement(),refreshPlayerGangMemberList)

function refreshPlayerInvite()
invited,gangName,inviter = isPlayerGangInvited(source)
if invited then
	if not getElementData(source,"gang") == "None" then return end
	local gangmember = #getGangMembers(gangName)
	local gangvip = getGangSlots (gangName)
	triggerClientEvent(source,"updatePlayerInvites",source,gangName,getPlayerName(inviter),gangmember,gangvip)
end
end
addEvent("refreshPlayerInvite",true)
addEventHandler("refreshPlayerInvite",getRootElement(),refreshPlayerInvite)

--Gui Triggers
function acceptGroupInvite()
invited,gangName,inviter = isPlayerGangInvited(source)
if invited then
	if #getGangMembers(getElementData(inviter,"gang"))+1 > getGangSlots(getElementData(inviter,"gang")) then outputChatBox(getPlayerName(source)..", #22ff22This group is full!",source,22,255,22,true) return end
	addGangMember(gangName,getAccountName(getPlayerAccount(source)),"Leader")
	outputChatBox(getPlayerName(source).." #22ff22 dołączył do grupy "..gangName.."!",getRootElement(),22,255,22,true)
end
end
addEvent("acceptGroupInvite",true)
addEventHandler("acceptGroupInvite",getRootElement(),acceptGroupInvite)

function destroyGroup()
	local groupleader = getGangLeader(getElementData(source,"gang"))
	if getAccountName(getPlayerAccount(source)) == groupleader then
		for i,gangmember in pairs(getGangMembers(getElementData(source,"gang"))) do
			removeGangMember(getAccountGang(getAccount(gangmember["member_account"])),gangmember["member_account"])
		end
		outputChatBox(getPlayerName(source).." #22ff22 zamkna grupe: "..getElementData(source,"gang")"!",getRootElement(),22,255,22,true)
		removeGang(getAccountGang(getAccountName(getPlayerAccount(source))))
	else
		outputChatBox(getPlayerName(source)..", #22ff22nie mozesz zamknac tej grupy!",source,22,255,22,true)
	end
end
addEvent("destroyGroup",true)
addEventHandler("destroyGroup",getRootElement(),destroyGroup)

function leaveGroup()
	if getElementData(source,"gang") == "None" then return end
		local groupleader = getGangLeader(getElementData(source,"gang"))
		if getAccountName(getPlayerAccount(source)) == groupleader then outputChatBox(getPlayerName(source)..",#22ff22 you can't leave your own group!",source,22,255,22,true) return end
		outputChatBox(getPlayerName(source).." #22ff22 opuścił grupę: "..getElementData(source,"gang").."!" ,getRootElement(),22,255,22,true)
		removeGangMember(getAccountGang(getAccountName(getPlayerAccount(source))),getAccountName(getPlayerAccount(source)))
end
addEvent("leaveGroup",true)
addEventHandler("leaveGroup",getRootElement(),leaveGroup)

function kickGroupMember (playerName)
	if getElementData(source,"gang") == "None" then return end
	if string.find(playerName,"(Leader)") then return end
	--if getPlayerName(source) == playerName then return end
		local groupleader = getGangLeader(getElementData(source,"gang"))
		if getAccountName(getPlayerAccount(source)) == groupleader or isGangSubLeader(getElementData(source,"gang"),getAccountName(getPlayerAccount(source))) then
			outputChatBox(playerName.." #22ff22 został wywalony z grupy "..getElementData(source,"gang").."!",getRootElement(),22,255,22,true)
			removeGangMember(getElementData(source,"gang"),playerName,getPlayerName(source))
		else
			outputChatBox(getPlayerName(source)..",#22ff22 niemożesz go wywalić!",source,22,255,22,true)
		end
end
addEvent("kickGroupMember",true)
addEventHandler("kickGroupMember",getRootElement(),kickGroupMember)

function addGroupSubLeader (playerName)
	if getElementData(source,"gang") == "None" then return end
	if string.find(playerName,"(Leader)") then return end
		local groupleader = getGangLeader(getElementData(source,"gang"))
		if getAccountName(getPlayerAccount(source)) == groupleader then
			if not getAccountPlayer(getAccount(playerName)) then outputChatBox(playerName.." #22ff22 needs to be online!",source,22,255,22,true) return end
			triggerEvent ( "gangSystem:addSubLeader", source, getPlayerName(getAccountPlayer(getAccount(playerName))) )
			outputChatBox(playerName.." #22ff22 jest teraz sub-liderem!",source,22,255,22,true)
			outputChatBox("Jesteś teraz sub-liderem!",getAccountPlayer(getAccount(playerName)),22,255,22,true)
		else
			outputChatBox(getPlayerName(source)..",#22ff22 nie jesteś liderem!",source,22,255,22,true)
		end
end
addEvent("addGroupSubLeader",true)
addEventHandler("addGroupSubLeader",getRootElement(),addGroupSubLeader)

function removeGroupSubLeader (playerName)
	if getElementData(source,"gang") == "None" then return end
	if string.find(playerName,"(Leader)") then return end
		local groupleader = getGangLeader(getElementData(source,"gang"))
		if getAccountName(getPlayerAccount(source)) == groupleader then
			if not getAccountPlayer(getAccount(playerName)) then outputChatBox(playerName..", #22ff22 musi być On-Line!",source,22,255,22,true) return end
			if isGangSubLeader(getElementData(source,"team"),playerName) then
				triggerEvent ( "gangSystem:removeSubLeader", source, getPlayerName(getAccountPlayer(getAccount(playerName))) )
				outputChatBox(playerName..", #22ff22 nie jest już sub-liderem!",source,22,255,22,true)
			else	
				outputChatBox(playerName..", #22ff22 nie jest sub-liderem!",source,22,255,22,true)
			end	
		else
			outputChatBox(getPlayerName(source).." #22ff22, nie jesteś już sub-liderem!",source,22,255,22,true)
		end
end
addEvent("removeGroupSubLeader",true)
addEventHandler("removeGroupSubLeader",getRootElement(),removeGroupSubLeader)

function invitePlayerToGroup (playerName)
	if getElementData(source,"gang") == "None" then return end
		local groupleader = getGangLeader(getElementData(source,"gang"))
		if getAccountName(getPlayerAccount(source)) == groupleader then
			if #getGangMembers(getElementData(source,"gang"))+1 < getGangSlots(getElementData(source,"gang")) then
			if not getPlayerFromName(playerName) == false then
				if getElementData(getPlayerFromName(playerName),"gang") == "None" then
					triggerEvent ( "gangSystem:invitePlayer", source, playerName )
				else
					outputChatBox(playerName.." #22ff22 jest już w grupie!",source,22,255,22,true)
				end	
			else
				outputChatBox(playerName.."#22ff22 nie jest On-Line!",source,22,255,22,true)
			end
			else
				outputChatBox(getPlayerName(source)..", #22ff22 twoja grupa jest pełna!",source,22,255,22,true)
			end
		else
			outputChatBox(getPlayerName(source)..", #22ff22 trzeba być liderem tej grupy!",source,22,255,22,true)
		end
end
addEvent("invitePlayerToGroup",true)
addEventHandler("invitePlayerToGroup",getRootElement(),invitePlayerToGroup)

function gangcreateCommandHandler (cmd)
if cmd == "creategang" then
	cancelEvent()
elseif cmd == "accept" then
	cancelEvent()
	outputChatBox("Naciśnij F1 i akceptuj zaproszenie!",source,255,255,255,true)
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
	if not isGuestAccount(getPlayerAccount(playersource)) and getElementData(playersource,"gang") == "None" then
		if teamName then
			if not isGangExisting (teamName) then
			addGang (teamName,getAccountName(getPlayerAccount(playersource)))
			setAccountData(getPlayerAccount(playersource),"gangslots",12)
			outputChatBox ("#FFFFFFTwoja grupa została założona, nazwa: "..teamName..".",playersource,27, 89, 224,true)	
			else
				outputChatBox ("#FFFFFFIstnieje grupa o takiej nazwie",playersource,27, 89, 224,true)	
			end
		else
			outputChatBox ("#FFFFFFUżyj /creategroup <name>!",playersource,27, 89, 224,true)	
		end
	else
		outputChatBox ("#FFFFFFJesteś już w grupie!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("creategroup",createGroupForPlayer)

function setGroupVIP (playersource,command,targetString,moreSlots)
	if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")))  then
		if getAccount(targetString) then
			local oldData = getAccountData(getAccount(targetString),"gangslots") or 0
			setAccountData(getAccount(targetString),"gangslots",oldData+moreSlots)
			outputChatBox(targetString.." jest obecnie grupą VIP. Aktualna liczba slotów: "..getAccountData(getAccount(targetString),"gangslots")..".",getRootElement(),22,255,22,true)
		end
	else
		outputChatBox ("#FFFFFFNie jesteś adminem!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("givevip",setGroupVIP)
