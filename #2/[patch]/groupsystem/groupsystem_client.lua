﻿playerGroupWindow ={}

playerGroupWindow["window"] = guiCreateWindow(0.3,0.2,0.4,0.6,"System grup",true)
guiSetVisible(playerGroupWindow["window"],false)
--grouplist
playerGroupWindow["grouplist"] = guiCreateGridList ( 0.025,0.05,0.95,0.6,true,playerGroupWindow["window"])
playerGroupWindow["grouplist_groupname"] = guiGridListAddColumn( playerGroupWindow["grouplist"], "Grupa", 0.45 )
playerGroupWindow["grouplist_groupleader"] = guiGridListAddColumn( playerGroupWindow["grouplist"], "Lider", 0.35 )
playerGroupWindow["grouplist_groupmember"] = guiGridListAddColumn( playerGroupWindow["grouplist"], "Członków", 0.1 )
playerGroupWindow["grouplist_info"] = guiCreateLabel(0.05,0.66,0.95,0.07,"Aby zrobić grupę wpisz /creategroup [nazwa] na T.",true,playerGroupWindow["window"])
guiSetFont (playerGroupWindow["grouplist_info"], "default-bold-small" )
--invitelist
playerGroupWindow["groupinvitelist"] = guiCreateGridList ( 0.025,0.7,0.95,0.175,true,playerGroupWindow["window"])
playerGroupWindow["groupinvitelist_groupname"] = guiGridListAddColumn( playerGroupWindow["groupinvitelist"], "Grupa", 0.45 )
playerGroupWindow["groupinvitelist_groupinviter"] = guiGridListAddColumn( playerGroupWindow["groupinvitelist"], "Dodany przez", 0.3 )
playerGroupWindow["groupinvitelist_groupmember"] = guiGridListAddColumn( playerGroupWindow["groupinvitelist"], "Członek", 0.1 )
playerGroupWindow["groupinvitelist_groupvip"] = guiGridListAddColumn( playerGroupWindow["groupinvitelist"], "VIP", 0.1 )
playerGroupWindow["groupinvite_accept"] = guiCreateButton(0.225,0.915,0.55,0.06, "Akceptuj zaproszenie", true, playerGroupWindow["window"] )

--Member Window
playerGroupWindow["member_window"] = guiCreateWindow(0.25,0.2,0.5,0.6,"Menu użytkownika grupy",true)
guiSetVisible(playerGroupWindow["member_window"],false)
--grouplist
playerGroupWindow["member_list"] = guiCreateGridList ( 0.025,0.05,0.95,0.65,true,playerGroupWindow["member_window"])
playerGroupWindow["member_list_name"] = guiGridListAddColumn( playerGroupWindow["member_list"], "Nazwa", 0.35 )
playerGroupWindow["member_list_murders"] = guiGridListAddColumn( playerGroupWindow["member_list"], "Morderstw", 0.15 )
playerGroupWindow["member_list_alivetime"] = guiGridListAddColumn( playerGroupWindow["member_list"], "Czas życia", 0.25 )
playerGroupWindow["member_list_movestate"] = guiGridListAddColumn( playerGroupWindow["member_list"], "Tryb poruszania", 0.2 )
--buttons
playerGroupWindow["member_list_destroygroup"] = guiCreateButton(0.025,0.875,0.175,0.1, "Usuń grupę", true, playerGroupWindow["member_window"] )
playerGroupWindow["member_list_leavegang"] = guiCreateButton(0.025,0.75,0.175,0.1, "Opuść grupę", true, playerGroupWindow["member_window"] )
playerGroupWindow["member_list_inviteplayer"] = guiCreateButton(0.225,0.75,0.175,0.1, "Zaproś gracza", true, playerGroupWindow["member_window"] )
playerGroupWindow["member_list_kickplayer"] = guiCreateButton(0.225,0.875,0.175,0.1, "Wyrzuć gracza", true, playerGroupWindow["member_window"] )
playerGroupWindow["member_list_removesubleader"] = guiCreateButton(0.425,0.75,0.175,0.1, "Usuń sub-lidera", true, playerGroupWindow["member_window"] )
playerGroupWindow["member_list_addsubleader"] = guiCreateButton(0.425,0.875,0.175,0.1, "Dodaj sub-lidera", true, playerGroupWindow["member_window"] )

--destroy Group
playerGroupWindow["member_list_destroygroup_reclick_window"] = guiCreateWindow(0.25,0.2,0.5,0.6,"Usuń grupę",true)
guiSetVisible(playerGroupWindow["member_list_destroygroup_reclick_window"],false)
playerGroupWindow["member_list_destroygroup_reclick_yes"] = guiCreateButton(0.2,0.675,0.2,0.2, "Tak", true, playerGroupWindow["member_list_destroygroup_reclick_window"] )
playerGroupWindow["member_list_destroygroup_reclick_cancel"] = guiCreateButton(0.6,0.675,0.2,0.2, "Anuluj", true, playerGroupWindow["member_list_destroygroup_reclick_window"] )
playerGroupWindow["member_list_destroygroup_reclick_text"] = guiCreateLabel(0.05,0.1,0.95,0.3,"Na pewno chcesz usunąć grupę?",true,playerGroupWindow["member_list_destroygroup_reclick_window"])
guiSetFont (playerGroupWindow["member_list_destroygroup_reclick_text"], "default-bold-small" )

--Player Invite List
playerGroupWindow["invite_member_list_window"] = guiCreateWindow(0.25,0.2,0.5,0.6,"Wyierz gracza",true)
guiSetVisible(playerGroupWindow["invite_member_list_window"],false)
playerGroupWindow["invite_member_list"] = guiCreateGridList ( 0.025,0.05,0.95,0.65,true,playerGroupWindow["invite_member_list_window"])
playerGroupWindow["invite_member_list_name"] = guiGridListAddColumn( playerGroupWindow["invite_member_list"], "Name", 1 )
playerGroupWindow["invite_member_list_invite"] = guiCreateButton(0.2,0.775,0.6,0.15, "Zaproś", true, playerGroupWindow["invite_member_list_window"] )

function openPlayerGroupWindow ()
	if not getElementData(getLocalPlayer(),"gang") == "logedin" then return end
	local showing = guiGetVisible(playerGroupWindow["window"])
	if showing == false then
		if isPlayerKeySpamming() then return end
		triggerServerEvent("refreshClientGangList", localPlayer)
		guiSetVisible(playerGroupWindow["member_window"],false)
		guiSetVisible(playerGroupWindow["invite_member_list_window"],false)
	end
	guiSetVisible(playerGroupWindow["window"],not showing)
	showCursor(not showing)
end
bindKey("F1","down",openPlayerGroupWindow)

function openMemberGroupWindow ()
	if getElementData(getLocalPlayer(),"gang") == "Brak" then return end
	local showing = guiGetVisible(playerGroupWindow["member_window"])
	if showing == false then
		if isPlayerKeySpamming() then return end
		guiSetVisible(playerGroupWindow["window"],false)
		refreshGangMemberTable()
	else
		guiSetVisible(playerGroupWindow["invite_member_list_window"],false)
	end
	guiSetVisible(playerGroupWindow["member_window"],not showing)
	showCursor(not showing)
end
bindKey("F2","down",openMemberGroupWindow)

function refreshGangList (ganglist)
	guiGridListClear(playerGroupWindow["grouplist"])
	for i, group in ipairs(ganglist) do
		local row = guiGridListAddRow ( playerGroupWindow["grouplist"] )
		guiGridListSetItemText ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupname"], group[1], false, false )
		guiGridListSetItemText ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupleader"],group[2] , false, false )
		guiGridListSetItemText ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupmember"],group[3].."/"..group[4] , false, false )
		if group[4] > 12 then
			guiGridListSetItemColor ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupname"], 22, 255, 22 )
			guiGridListSetItemColor ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupleader"], 22, 255, 22 )
			guiGridListSetItemColor ( playerGroupWindow["grouplist"], row, playerGroupWindow["grouplist_groupmember"], 22, 255, 22 )
		end
	end	
	refreshPlayerInvites()
end
addEvent("refreshGangListToClient", true)
addEventHandler("refreshGangListToClient", root, refreshGangList)

--Actions
function refreshGangMemberTable()
	triggerServerEvent("refreshPlayerGangMemberList",getLocalPlayer())
end

function refreshGangMemberTable2 (gangtable)	
	guiGridListClear(playerGroupWindow["member_list"])
	for i, gangmember in ipairs(gangtable) do
		local row = guiGridListAddRow ( playerGroupWindow["member_list"] )
		local player = gangmember[4]
		if gangmember[2] then
			gangmember[1] = gangmember[1].." (Lider)"
		else
			gangmember[1] = gangmember[1]
		end
		if gangmember[3] then
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_murders"], getElementData(player,"murders"), false, false )
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_alivetime"],getElementData(player,"alivetime") , false, false )
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_movestate"],isPedInVehicle (player) and "Pojazd" or "Pieszo" , false, false )
		else
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_murders"], "-", false, false )
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_alivetime"],"-" , false, false )
			guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_movestate"],"-" , false, false )
		end
		r,g,b = 255,22,22
		if gangmember[3] then
			r,g,b = 22,255,22
		end
		guiGridListSetItemText ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_name"], gangmember[1], false, false )
		guiGridListSetItemColor ( playerGroupWindow["member_list"], row, playerGroupWindow["member_list_name"], r, g, b )
	end	
end
addEvent("refreshGangMemberTableToClient", true)
addEventHandler("refreshGangMemberTableToClient", root, refreshGangMemberTable2)

function refreshPlayerInvites()
	triggerServerEvent("refreshPlayerInvite",getLocalPlayer())
end

function updatePlayerInvites(name,inviter,member,vip)
	guiGridListClear(playerGroupWindow["groupinvitelist"])
	local row = guiGridListAddRow ( playerGroupWindow["groupinvitelist"])
	guiGridListSetItemText ( playerGroupWindow["groupinvitelist"], row, playerGroupWindow["groupinvitelist_groupname"],name, false, false )
	guiGridListSetItemText ( playerGroupWindow["groupinvitelist"], row, playerGroupWindow["groupinvitelist_groupinviter"],inviter, false, false )
	guiGridListSetItemText ( playerGroupWindow["groupinvitelist"], row, playerGroupWindow["groupinvitelist_groupmember"],member, false, false )
	if vip > 12 then
		guiGridListSetItemText ( playerGroupWindow["groupinvitelist"], row, playerGroupWindow["groupinvitelist_groupvip"],"Tak", false, false )
	else
		guiGridListSetItemText ( playerGroupWindow["groupinvitelist"], row, playerGroupWindow["groupinvitelist_groupvip"],"Nie", false, false )
	end	
end
addEvent("updatePlayerInvites",true)
addEventHandler("updatePlayerInvites",getRootElement(),updatePlayerInvites)

function removePlayerInvites()
	guiGridListClear(playerGroupWindow["groupinvitelist"])
end
addEvent("removePlayerInvites",true)
addEventHandler("removePlayerInvites",getRootElement(),removePlayerInvites)

function refreshPlayerInviteList ()
	guiGridListClear(playerGroupWindow["invite_member_list"])
	for i, player in ipairs(getElementsByType("player")) do
		if getElementData(player,"gang") == "Brak" then
			local row = guiGridListAddRow ( playerGroupWindow["invite_member_list"] )
			guiGridListSetItemText ( playerGroupWindow["invite_member_list"], row, playerGroupWindow["invite_member_list_name"],getPlayerName(player), false, false )
		end
	end
end

function playerGroupSystemButton (button,state)
if not button == "mouse1" and not state == "down" then return end
if source == playerGroupWindow["groupinvite_accept"] then
	triggerServerEvent("acceptGroupInvite",getLocalPlayer())
	guiGridListClear(playerGroupWindow["groupinvitelist"])
	guiSetVisible(playerGroupWindow["window"],false)
	showCursor(false)
elseif source == playerGroupWindow["member_list_destroygroup"] then
	guiSetVisible(playerGroupWindow["member_list_destroygroup_reclick_window"],true)
	guiBringToFront(playerGroupWindow["member_list_destroygroup_reclick_window"])
elseif source == playerGroupWindow["member_list_destroygroup_reclick_yes"] then
	triggerServerEvent("destroyGroup",getLocalPlayer())
	guiSetVisible(playerGroupWindow["member_list_destroygroup_reclick_window"],false)
	guiSetVisible(playerGroupWindow["member_window"],false)
	showCursor(false)
elseif source == playerGroupWindow["member_list_destroygroup_reclick_cancel"] then
	guiSetVisible(playerGroupWindow["member_list_destroygroup_reclick_window"],false)
elseif source == playerGroupWindow["member_list_leavegang"] then
	triggerServerEvent("leaveGroup",getLocalPlayer())
	guiSetVisible(playerGroupWindow["member_window"],false)
	showCursor(false)
elseif source == playerGroupWindow["member_list_inviteplayer"] then
	guiSetVisible(playerGroupWindow["invite_member_list_window"],true)
	guiBringToFront(playerGroupWindow["invite_member_list_window"])
	refreshPlayerInviteList()
elseif source == playerGroupWindow["invite_member_list_invite"] then
	local playerName = guiGridListGetItemText ( playerGroupWindow["invite_member_list"], guiGridListGetSelectedItem ( playerGroupWindow["invite_member_list"] ), 1 )
	triggerServerEvent("invitePlayerToGroup",getLocalPlayer(),playerName)
	guiSetVisible(playerGroupWindow["invite_member_list_window"],true)
elseif source == playerGroupWindow["member_list_kickplayer"] then
	local playerName = guiGridListGetItemText ( playerGroupWindow["member_list"], guiGridListGetSelectedItem ( playerGroupWindow["member_list"] ), 1 )
	triggerServerEvent("kickGroupMember",getLocalPlayer(),playerName)
	guiSetVisible(playerGroupWindow["member_window"],false)
	showCursor(false)
elseif source == playerGroupWindow["member_list_removesubleader"] then
	local playerName = guiGridListGetItemText ( playerGroupWindow["member_list"], guiGridListGetSelectedItem ( playerGroupWindow["member_list"] ), 1 )
	triggerServerEvent("removeGroupSubLeader",getLocalPlayer(),playerName)
elseif source == playerGroupWindow["member_list_addsubleader"] then
	local playerName = guiGridListGetItemText ( playerGroupWindow["member_list"], guiGridListGetSelectedItem ( playerGroupWindow["member_list"] ), 1 )
	triggerServerEvent("addGroupSubLeader",getLocalPlayer(),playerName)
end
end
addEventHandler("onClientGUIClick",playerGroupWindow["groupinvite_accept"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_destroygroup"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_leavegang"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_inviteplayer"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_kickplayer"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_removesubleader"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_addsubleader"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_destroygroup_reclick_cancel"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["member_list_destroygroup_reclick_yes"],playerGroupSystemButton,false)
addEventHandler("onClientGUIClick",playerGroupWindow["invite_member_list_invite"],playerGroupSystemButton,false)
--

local openGangTick = getTickCount()

function isPlayerKeySpamming()
	local passed = getTickCount() - openGangTick
	if passed < 1000 then
		outputChatBox("Musisz odczekać "..math.floor((1500-passed)/1000+1).." sek. aby włączyć panel!", 255, 255, 0,true)
		return true
	else
		openGangTick = getTickCount()
		return false
	end
end

--GPS
playerBlibs = {}
amouunt = 0
function updateGPS ()
	amouunt = 0
	local gangname = getElementData(getLocalPlayer(),"gang")
	for i, blip in ipairs(playerBlibs) do
		if isElement(blip) then
			destroyElement(blip)
		end
	end
	if getElementData(getLocalPlayer(),"gang") == "Brak" then return end	
	playerBlibs = {}	
	for i, player in ipairs(getElementsByType("player")) do
		if gangname == getElementData(player,"gang") and player ~= localPlayer then
			amouunt = amouunt+1
			playerBlibs[amouunt] = createBlipAttachedTo(player,0,2,22,255,22)
			setBlipVisibleDistance(playerBlibs[amouunt],1000)
		end
	end
end
setTimer(updateGPS,10000,0)