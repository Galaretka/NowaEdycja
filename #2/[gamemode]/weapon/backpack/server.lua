elementBackpack = {}
function playerBackPackToBack(dataName,oldValue)
	if getElementType(source) == "player" or getElementType(source) == "ped" then
		if (dataName == "MAX_Slots") then
			local backpackSlots = getElementData(source,dataName)
			if elementBackpack[source] and isElement(elementBackpack[source]) then
				exports.bone_attach:detachElementFromBone(elementBackpack[source])
				destroyElement(elementBackpack[source])
				elementBackpack[source] = false
			end
			if (backpackSlots == 8) then return end
			local x,y,z = getElementPosition(source)
			if (backpackSlots == 12 or backpackSlots == 16) then
				elementBackpack[source] = createObject(1866,x,y,z)
			elseif (backpackSlots == 13 or backpackSlots == 17) then
				elementBackpack[source] = createObject(1867,x,y,z)
			elseif (backpackSlots == 20 or backpackSlots == 24) then
				elementBackpack[source] = createObject(1868,x,y,z)
			elseif (backpackSlots == 25 or backpackSlots == 29) then
				elementBackpack[source] = createObject(1869,x,y,z)
			elseif (backpackSlots == 30 or backpackSlots == 34) then
				elementBackpack[source] = createObject(1870,x,y,z)
			elseif (backpackSlots == 35 or backpackSlots == 39) then
				elementBackpack[source] = createObject(1871,x,y,z)
			end
			if (backpackSlots == 35 or backpackSlots == 39) then
				exports.bone_attach:attachElementToBone(elementBackpack[source],source,3,0,-0.16,0.048,270,0,180)
			else
				exports.bone_attach:attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.048,90,0,0)
			end
		end
	end	
end
addEventHandler("onElementDataChange", getRootElement(), playerBackPackToBack)

local backpackGround = {}

addEvent("backpackGroundOpen",true)
addEventHandler("backpackGroundOpen",getRootElement(),function()
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
    setPedAnimation (source,"BOMBER","BOM_Plant_Loop",nil,false,false,false,false)
	--setPedAnimation(source,"BOMBER","BOM_Plant_Loop",nil,true,false,false,false)
	local x,y,z = getElementPosition(source)
	prot = getPedRotation(source)
	local offsetRot = math.rad(prot+90)
	local vx = x + 0.75 * math.cos(offsetRot)
	local vy = y + 0.75 * math.sin(offsetRot)
	local vrot = prot+180
	local backpackSlots = getElementData(source,"MAX_Slots")
	if (backpackSlots == 12 or backpackSlots == 16) then
		backpackGround[source] = createObject(1866,vx,vy,z-0.8,100,180,vrot)
	elseif (backpackSlots == 13 or backpackSlots == 17) then
		backpackGround[source] = createObject(1867,vx,vy,z-0.8,100,180,vrot)
	elseif (backpackSlots == 20 or backpackSlots == 24) then
		backpackGround[source] = createObject(1868,vx,vy,z-0.8,100,180,vrot)
	elseif (backpackSlots == 25 or backpackSlots == 29) then
		backpackGround[source] = createObject(1869,vx,vy,z-0.9,100,180,vrot)
	elseif (backpackSlots == 30 or backpackSlots == 34) then
		backpackGround[source] = createObject(1870,vx,vy,z-0.8,100,180,vrot)
	elseif (backpackSlots == 35 or backpackSlots == 39) then
		backpackGround[source] = createObject(1871,vx,vy,z-0.75,-70,0,vrot)
	end
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		setElementAlpha(elementBackpack[source],0)
	end
end)

addEvent("backpackGroundClose",true)
addEventHandler("backpackGroundClose",getRootElement(),function()
	if backpackGround[source] and isElement(backpackGround[source]) then
		destroyElement(backpackGround[source])
	end
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		setElementAlpha(elementBackpack[source],255)
	end
	setPedAnimation(source,false)
end)

addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),function()
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		exports.bone_attach:detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if backpackGround[source] and isElement(backpackGround[source]) then
		destroyElement(backpackGround[source])
	end
end)

addEventHandler ("onPlayerQuit", getRootElement(),function()
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		exports.bone_attach:detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if backpackGround[source] and isElement(backpackGround[source]) then
		destroyElement(backpackGround[source])
	end
end)

addEventHandler ("onPlayerBan", getRootElement(),function()
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		exports.bone_attach:detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if backpackGround[source] and isElement(backpackGround[source]) then
		destroyElement(backpackGround[source])
	end
end)

addEventHandler ("onPlayerLogout", getRootElement(),function()
	if elementBackpack[source] and isElement(elementBackpack[source]) then
		exports.bone_attach:detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if backpackGround[source] and isElement(backpackGround[source]) then
		destroyElement(backpackGround[source])
	end
end)