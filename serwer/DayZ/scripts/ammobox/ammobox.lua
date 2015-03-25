player_blips = {} --creating a table
function tentadayz(thePlayer)
accountname = getAccountName(getPlayerAccount(thePlayer))
if isObjectInACLGroup("user." .. accountname, aclGetGroup("Admin")) then
do
local x, y, z = getElementPosition(thePlayer)
tent = createObject(2358, x + 5, y, z)
setObjectScale(tent, 2)
tentCol = createColSphere(x + 5, y, z, 4)
local blip = createBlipAttachedTo(tentCol)
player_blips[tentCol] = blip --storing the blip into the table under the player element key
attachElements(tentCol, tent, 0, 0, 0)
setElementData(tentCol, "parent", tent)
setElementData(tent, "parent", tentCol)
setElementData(tentCol, "tent", true)
setElementData(tentCol, "vehicle", true)
setElementData(tentCol, "MAX_Slots", 0)
setElementData(tentCol, "AKS-74 Kobra", 5)
setElementData(tentCol, "30Rnd. AKS", 10)
setElementData(tentCol, "DMR", 2)
setElementData(tentCol, "DMR Mag", 10)
setElementData(tentCol, "Medic Kit", 5)
setElementData(tentCol, "Bandage", 5)
setElementData(tentCol, "Ghillie Suit III", 1)
setElementData(tentCol, "Ghillie Suit II", 1)
setElementData(tentCol, "Ghillie Suit", 1)
setElementData(tentCol, "OSPack Backpack", 2)
setElementData(tentCol, "Toolbox", 2)
outputChatBox ( "Wykonany zostal zrzut! Czerwony kwadracik na mapie!", getRootElement(), 255, 255, 255, true )
delbliptimer = setTimer(delBlip, 1800000, 1)
end
else
end
end

function delBlip()
	local blip = player_blips[tentCol] --retrieving the blip from the table
    destroyElement(blip)
	player_blips[tentCol] = nil
	killTimer(delbliptimer)
end
addCommandHandler("zrzut", tentadayz)
