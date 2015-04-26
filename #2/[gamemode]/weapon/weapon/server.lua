function rearmPlayerWeapon (weaponName,slot,main,addit,spec,pistol)
	takeAllWeapons (source)
	local ammoData_new,weapID_new = getWeaponAmmoType (weaponName)
	if getElementData(source,ammoData_new) <= 0 then
		triggerClientEvent (source, "displayClientInfo", source,"Rearm","Brak naboi.",255,22,0)
		return
	end
	local weapon_main = getElementData(source,"currentweapon_1") or "noweap"
	if weapon_main and weapon ~= "noweap" then
		ammoData,weapID_main = getWeaponAmmoType (weapon_main)
		giveWeapon(source,weapID_main,getElementData(source,ammoData), main or false )
	end
	local weapon = getElementData(source,"currentweapon_2") or "noweap"
	if weapon and weapon ~= "noweap" then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), addit or false )
	end
	local weapon = getElementData(source,"currentweapon_3") or "noweap"
	if weapon and weapon ~= "noweap" then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), spec or false )
	end
	local weapon = getElementData(source,"currentweapon_4") or "noweap"
	if weapon and weapon ~= "noweap" then
		local ammoData,weapID = getWeaponAmmoType (weapon)
		giveWeapon(source,weapID,getElementData(source,ammoData), pistol or false )
	end
	if main and elementWeaponBack[source] then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])
		elementWeaponBack[source] = false
	end 
	if addit and elementWeaponBackCold[source] then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])
		elementWeaponBackCold[source] = false
	end 
	if not elementWeaponBack[source] and weapon_main ~= 'noweap' and (getElementData ( source, weapon_main) or 0 ) > 0 and ( ( getElementData ( source, ammoData_new ) or 0 ) <= 0 or not main ) then
		local objid = getWeaponObjectID(weapID_main)
		if not objid then return true end
		local x,y,z = getElementPosition(source)
		elementWeaponBack[source] = createObject(objid,x,y,z)
		setObjectScale(elementWeaponBack[source],0.98)
		if elementBackpack[source] then
			exports.bone_attach:attachElementToBone(elementWeaponBack[source],source,3,-0.2,-0.235,-0.14,-3,275,-90)
		else
			exports.bone_attach:attachElementToBone(elementWeaponBack[source],source,3,-0.21,-0.11,-0.14,-5,275,180)
		end
	end
--	setElementModel(source, getElementData(source,"skin"))
end
addEvent("onPlayerRearmWeapon",true)
addEventHandler("onPlayerRearmWeapon",getRootElement(),rearmPlayerWeapon)

weaponIDtoObjectID = {
	{30,355},
	{31,356},
	{25,349},
	{26,350},
	{27,351},
	{33,357},
	{34,358},
	{36,360},
	{35,359},
	{15,326},
	{8,339},
	{7,338},
	{5,336},
	{6,337},
	{3,334},
	{2,333},
}

function getWeaponObjectID (weaponID)
	for i,weaponData in ipairs(weaponIDtoObjectID) do
		if weaponID == weaponData[1] then
			return weaponData[2]
		end
	end
end	

elementWeaponReplace = {}
function weaponReplace ( previousWeaponID, currentWeaponID )
	local weapon1 = getElementData(source,"currentweapon_1")
	if not weapon1 then return end
	local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
	local x,y,z = getElementPosition(source)
	local rx,ry,rz = getElementRotation(source)
	if currentWeaponID == weapID1 then
		if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
			exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
            destroyElement(elementWeaponReplace[source])
			elementWeaponReplace[source] = false
		end
		if weapon1 == "Kusza" then
			elementWeaponReplace[source] = createObject(1952,x,y,z)
			setObjectScale(elementWeaponReplace[source],0.74)
		elseif weapon1 == "SKS" then 
			elementWeaponReplace[source] = createObject(2412,x,y,z)
		elseif weapon1 == "Sporter 22" then 
			elementWeaponReplace[source] = createObject(2412,x,y,z)
		elseif weapon1 == "Blaze 95" then 
			elementWeaponReplace[source] = createObject(2412,x,y,z)
		elseif weapon1 == "Mosin 9130" then 
			elementWeaponReplace[source] = createObject(2228,x,y,z)
		end 
		if elementBackpack[source] then 
			exports.bone_attach:attachElementToBone(elementWeaponReplace[source],source,12,0,0,0.1,180,85,200)
		else
--			exports.bone_attach:attachElementToBone(elementWeaponReplace[source],source,12,0,0,0.1,177,95,200)
			exports.bone_attach:attachElementToBone(elementWeaponReplace[source],source,12,0,0,0.1,180,85,200)
		end 
	elseif previousWeaponID == weapID1 then
	if  isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])
		elementWeaponReplace[source] = false 
	end
	end 
end 
addEventHandler("onPlayerWeaponSwitch", getRootElement(), weaponReplace)

elementWeaponBack = {}
elementWeaponBackCold = {}
function weaponSwitchBack ( previousWeaponID, currentWeaponID )
	local weapon1 = getElementData(source,"currentweapon_1")
	local weapon2 = getElementData(source,"currentweapon_2")
	if not weapon1 and not weapon2 then return end
	local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
	local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
	local x,y,z = getElementPosition(source)
	local rx,ry,rz = getElementRotation(source)
	if previousWeaponID == weapID1 then
		if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
			exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])
			elementWeaponBack[source] = false
		end
		if weapon1 == "Kusza" then
			elementWeaponBack[source] = createObject(1952,x,y,z)
			setObjectScale(elementWeaponBack[source],0.74)
		elseif weapon1 == "SKS" then
			elementWeaponBack[source] = createObject(2412,x,y,z)
			setObjectScale(elementWeaponBack[source],0.98)
		elseif weapon1 == "Sporter 22" then
			elementWeaponBack[source] = createObject(2412,x,y,z)
			setObjectScale(elementWeaponBack[source],0.98)
		elseif weapon1 == "Blaze 95" then
			elementWeaponBack[source] = createObject(2412,x,y,z)
			setObjectScale(elementWeaponBack[source],0.98)
		elseif weapon1 == "Mosin 9130" then
			elementWeaponBack[source] = createObject(2228,x,y,z)
			setObjectScale(elementWeaponBack[source],0.98)
		else
			local objid = getWeaponObjectID(weapID1)
			if not objid then return true end
			elementWeaponBack[source] = createObject(objid,x,y,z)
			setObjectScale(elementWeaponBack[source],0.98)
		end
		if elementBackpack[source] then
			exports.bone_attach:attachElementToBone(elementWeaponBack[source],source,3,-0.2,-0.235,-0.14,-3,275,-90)
		else
			exports.bone_attach:attachElementToBone(elementWeaponBack[source],source,3,-0.21,-0.11,-0.14,-5,275,180)
		end
	elseif currentWeaponID == weapID1 then
		if elementWeaponBack[source] and isElement(elementWeaponBack[source] ) then
			exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])
			elementWeaponBack[source] = false
		end
	end
	if previousWeaponID == weapID2 then
		if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source] ) then
			exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
			destroyElement(elementWeaponBackCold[source])
			elementWeaponBackCold[source] = false
		end
		if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
			exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
			destroyElement(elementWeaponReplace[source])
			elementWeaponReplace[source] = false
		end
		local objid = getWeaponObjectID(weapID2)
		if not objid then return true end
		elementWeaponBackCold[source] = createObject(objid,x,y,z)
		if elementBackpack[source] then
			exports.bone_attach:attachElementToBone(elementWeaponBackCold[source],source,3,0.24,-0.145,0.45,5,180,-5)
		else
			exports.bone_attach:attachElementToBone(elementWeaponBackCold[source],source,3,0.24,-0.145,0.45,5,180,-5)
		end
	elseif currentWeaponID == weapID2 then
		if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
			exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
			destroyElement(elementWeaponBackCold[source])
			elementWeaponBackCold[source] = false
		end
		if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
			exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
			destroyElement(elementWeaponReplace[source])
			elementWeaponReplace[source] = false
		end
	end
end
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), weaponSwitchBack )

function weaponDelete(dataName,oldValue)
	if getElementType(source) == "player" then
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		local weapon4 = getElementData(source,"currentweapon_4")
		if dataName == "currentweapon_1" and getElementData ( source, dataName ) == "noweap" then
			local ammoData,weapID = getWeaponAmmoType(oldValue)
			if weapID then
				takeWeapon (source,weapID)
			end
		elseif dataName == "currentweapon_2" and getElementData ( source, dataName ) == "noweap" then
			local ammoData,weapID = getWeaponAmmoType(oldValue)
			if weapID then
				takeWeapon (source,weapID)
			end
		end
		if dataName == weapon1 or dataName == weapon2 or dataName == weapon3 or dataName == weapon4 then
			if getElementData (source,dataName) == 0 then
				local ammoData,weapID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
				if dataName == weapon1 then
					setElementData(source,"currentweapon_1","noweap")
					triggerClientEvent (source,"playerCurrentWeapChanged",source)
				elseif dataName == weapon2 then
					setElementData(source,"currentweapon_2","noweap")
					triggerClientEvent (source,"playerCurrentWeapChanged",source)
				elseif dataName == weapon3 then
					setElementData(source,"currentweapon_3","noweap")
				elseif dataName == weapon4 then
					setElementData(source,"currentweapon_4","noweap")
				end
				--triggerClientEvent (source,"playerDroppedWeapon",source,dataName)
			end
		end
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		local weapon4 = getElementData(source,"currentweapon_4")
		local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
		local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
		local ammoData3,weapID3 = getWeaponAmmoType(weapon3)
		local ammoData4,weapID4 = getWeaponAmmoType(weapon4)
		if dataName == ammoData1 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID1,newammo)
				if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
					exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
					destroyElement(elementWeaponBack[source])	
					elementWeaponBack[source] = false
				end	
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID1,getElementData (source,dataName)-oldValue,true)
			end
		end	
		if dataName == ammoData2 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID2,newammo) 
				if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
					exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
					destroyElement(elementWeaponBackCold[source])	
					elementWeaponBackCold[source] = false
				end
				if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
					exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
					destroyElement(elementWeaponReplace[source])
					elementWeaponReplace[source] = false
				end
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID2,getElementData (source,dataName)-oldValue,false)
			end
		end	
		if dataName == ammoData4 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID4,newammo) 
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID4,getElementData (source,dataName)-oldValue,false)
			end
		end	
		if dataName == ammoData3 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID3,newammo) 
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID3,getElementData (source,dataName)-oldValue,false)
			end	
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)

addEvent("removeBackWeaponOnDrop",true)
addEventHandler("removeBackWeaponOnDrop",getRootElement(),function()
	if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)

addEvent("removeNewWeapon",true)
addEventHandler("removeNewWeapon",getRootElement(),function()
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)

addEvent("removeBackWeaponOnDropCold",true)
addEventHandler("removeBackWeaponOnDropCold",getRootElement(),function()
	if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])	
		elementWeaponBackCold[source] = false
	end
end)

addEventHandler("onPlayerQuit", getRootElement(), function()
	if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])	
		elementWeaponBackCold[source] = false
	end
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)

addEventHandler("onPlayerBan", getRootElement(), function()
	if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])	
		elementWeaponBackCold[source] = false
	end
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)

addEventHandler("onPlayerLogout", getRootElement(), function()
	if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])	
		elementWeaponBackCold[source] = false
	end
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)

addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),function()
	if elementWeaponBack[source] and isElement(elementWeaponBack[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponBackCold[source] and isElement(elementWeaponBackCold[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponBackCold[source])
		destroyElement(elementWeaponBackCold[source])	
		elementWeaponBackCold[source] = false
	end
	if elementWeaponReplace[source] and isElement(elementWeaponReplace[source]) then
		exports.bone_attach:detachElementFromBone(elementWeaponReplace[source])
		destroyElement(elementWeaponReplace[source])	
		elementWeaponReplace[source] = false
	end
end)