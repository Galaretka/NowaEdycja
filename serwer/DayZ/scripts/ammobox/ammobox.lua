function tentadayz(thePlayer)
accountname = getAccountName(getPlayerAccount(thePlayer))
if isObjectInACLGroup("user." .. accountname, aclGetGroup("Admin")) then
do
local x, y, z = getElementPosition(thePlayer)
tent = createObject(2358, x + 5, y, z)
setObjectScale(tent, 2)
tentCol = createColSphere(x + 5, y, z, 4)
local myBlip = createBlip( x, y, z, 47, 0, 0, 0, 255)
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
outputChatBox ( "Wykonany zostal zrzut! Litera Z na mapie", getRootElement(), 255, 255, 255, true )
setTimer(delBlip, 600000, 0)
end
else
end
end

function delBlip()
	destroyElement(myBlip)
end
addCommandHandler("zrzut", tentadayz)
