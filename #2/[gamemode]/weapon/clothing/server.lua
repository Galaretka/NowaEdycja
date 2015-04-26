elementHelmets = {}
elementGlasses = {}
elementMasks = {}
elementHats = {}
elementVest = {}

function attachedElementsToPlayerBone(dataName,oldValue)
	if getElementType(source) == "player" or getElementType(source) == "ped" then
		if (dataName == "Helmets") then
			local helmID = getElementData(source,dataName)
			if elementHelmets[source] and isElement(elementHelmets[source]) then
				exports.bone_attach:detachElementFromBone(elementHelmets[source])
				destroyElement(elementHelmets[source])
				elementHelmets[source] = false
			end
			if (helmID == 0) then return end
			local x,y,z = getElementPosition(source)
			if (helmID == 10) then-- Kask motocyklowy
				elementHelmets[source] = createObject(2052,x,y,z)
				exports.bone_attach:attachElementToBone(elementHelmets[source],source,1,0,-0.035,-0.65,0,0,89)
			end
		end
--------------------------------------------------------------------------------------------------------
		if (dataName == "Glasses") then
			local glassID = getElementData(source,dataName)
			if elementGlasses[source] and isElement(elementGlasses[source]) then
				exports.bone_attach:detachElementFromBone(elementGlasses[source])
				destroyElement(elementGlasses[source])
				elementGlasses[source] = false
			end
			if (glassID == 0) then return end
			local x,y,z = getElementPosition(source)
			if (glassID == 10) then-- Ракетные Авиаторы
				elementGlasses[source] = createObject(1851,x,y,z)
				exports.bone_attach:attachElementToBone(elementGlasses[source],source,1,0.005,-0.015,-0.575,0,0,90)
			end
		end
--------------------------------------------------------------------------------------------------------
		if (dataName == "Masks") then
			local maskID = getElementData(source,dataName)
			if elementMasks[source] and isElement(elementMasks[source]) then
				exports.bone_attach:detachElementFromBone(elementMasks[source])
				destroyElement(elementMasks[source])
				elementMasks[source] = false
			end
			if (maskID == 0) then return end
			local x,y,z = getElementPosition(source)
			if (maskID == 1) then-- Respirator
				elementMasks[source] = createObject(1853,x,y,z)
				exports.bone_attach:attachElementToBone(elementMasks[source],source,1,-0.001,-0.005,-0.58,0,0,87)
			elseif (maskID == 2) then-- Maska gazowa
				elementMasks[source] = createObject(1855,x,y,z)
				exports.bone_attach:attachElementToBone(elementMasks[source],source,1,0.007,-0.021,-0.574,0,0,89)
			elseif (maskID == 3) then-- Maska 'Hoxton'
				elementMasks[source] = createObject(1856,x,y,z)
				exports.bone_attach:attachElementToBone(elementMasks[source],source,1,-0.018,0.03,-0.55,95,180,0)
			elseif (maskID == 4) then-- Maska 'Dallas'
				elementMasks[source] = createObject(1857,x,y,z)
				exports.bone_attach:attachElementToBone(elementMasks[source],source,1,-0.015,-0.17,-0.66,80,180,0)
			elseif (maskID == 5) then-- Maska 'Wilk'
				elementMasks[source] = createObject(1858,x,y,z)
				exports.bone_attach:attachElementToBone(elementMasks[source],source,1,-0.011,-0.07,-0.546,85,180,0)
			end
		end
--------------------------------------------------------------------------------------------------------
		if (dataName == "Hats") then
			local hatsID = getElementData(source,dataName)
			if elementHats[source] and isElement(elementHats[source])  then
				exports.bone_attach:detachElementFromBone(elementHats[source])
				destroyElement(elementHats[source])
				elementHats[source] = false
			end
			if (hatsID == 0) then return end
			local x,y,z = getElementPosition(source)
			if (hatsID == 1) then-- Nauszniki
				elementHats[source] = createObject(1930,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0.005,0.08,-0.55,0,-10,90)
			elseif (hatsID == 2) then-- Kowbojski kapelusz
				elementHats[source] = createObject(1931,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0,0.085,-0.55,0,-10,90)
			elseif (hatsID == 3) then-- Czapka
				elementHats[source] = createObject(1932,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0.005,0.195,-0.53,0,-20,90)
			elseif (hatsID == 4) then-- Okrągła czapka
				elementHats[source] = createObject(1933,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0.005,0.135,-0.55,0,-15,90)
			elseif (hatsID == 5) then-- Beret
				elementHats[source] = createObject(1934,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0,0.31,-0.48,0,-30,90)
			elseif (hatsID == 6) then-- Beret wojskowy
				elementHats[source] = createObject(1935,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0,0.2,-0.53,0,-20,90)
			elseif (hatsID == 7) then-- Panama
				elementHats[source] = createObject(1936,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0,0.205,-0.54,0,-20,90)
			elseif (hatsID == 8) then-- Hełm wojskowy
				elementHats[source] = createObject(1937,x,y,z)
				exports.bone_attach:attachElementToBone(elementHats[source],source,1,0.001,0.215,-0.545,0,-20,90)
			end
		end
--------------------------------------------------------------------------------------------------------
		if (dataName == "Vest") then
			local vestID = getElementData(source,dataName)
			if elementVest[source] and isElement(elementVest[source])  then
				exports.bone_attach:detachElementFromBone(elementVest[source])
				destroyElement(elementVest[source])
				elementVest[source] = false
			end
			if (vestID == 0) then return end
			local x,y,z = getElementPosition(source)
			if (vestID == 1) then-- Kamizelka taktyczna
				elementVest[source] = createObject(2705,x,y,z)
				exports.bone_attach:attachElementToBone(elementVest[source],source,3,0,-0.02,-0.19,0,5,90)
			elseif (vestID == 2) then-- Келваровый жилет
				elementVest[source] = createObject(2706,x,y,z)
				exports.bone_attach:attachElementToBone(elementVest[source],source,3,0,-0.02,-0.19,0,5,90)
			end
		end
	end	
end
addEventHandler("onElementDataChange", getRootElement(), attachedElementsToPlayerBone)

addEventHandler ( "onPlayerQuit", getRootElement(), function()
	if elementHelmets[source] and isElement(elementHelmets[source]) then
		exports.bone_attach:detachElementFromBone(elementHelmets[source])
		destroyElement(elementHelmets[source])
	end
	if elementMasks[source] and isElement(elementMasks[source]) then
		exports.bone_attach:detachElementFromBone(elementMasks[source])
		destroyElement(elementMasks[source])
	end
	if elementGlasses[source] and isElement(elementGlasses[source]) then
		exports.bone_attach:detachElementFromBone(elementGlasses[source])
		destroyElement(elementGlasses[source])
	end
	if elementHats[source] and isElement(elementHats[source]) then
		exports.bone_attach:detachElementFromBone(elementHats[source])
		destroyElement(elementHats[source])
	end
	if elementVest[source] and isElement(elementVest[source]) then
		exports.bone_attach:detachElementFromBone(elementVest[source])
		destroyElement(elementVest[source])
	end
end)

addEventHandler ( "onPlayerBan", getRootElement(), function()
	if elementHelmets[source] and isElement(elementHelmets[source]) then
		exports.bone_attach:detachElementFromBone(elementHelmets[source])
		destroyElement(elementHelmets[source])
	end
	if elementMasks[source] and isElement(elementMasks[source]) then
		exports.bone_attach:detachElementFromBone(elementMasks[source])
		destroyElement(elementMasks[source])
	end
	if elementGlasses[source] and isElement(elementGlasses[source]) then
		exports.bone_attach:detachElementFromBone(elementGlasses[source])
		destroyElement(elementGlasses[source])
	end
	if elementHats[source] and isElement(elementHats[source]) then
		exports.bone_attach:detachElementFromBone(elementHats[source])
		destroyElement(elementHats[source])
	end
	if elementVest[source] and isElement(elementVest[source]) then
		exports.bone_attach:detachElementFromBone(elementVest[source])
		destroyElement(elementVest[source])
	end
end)

addEventHandler ( "onPlayerLogout", getRootElement(), function()
	if elementHelmets[source] and isElement(elementHelmets[source]) then
		exports.bone_attach:detachElementFromBone(elementHelmets[source])
		destroyElement(elementHelmets[source])
	end
	if elementMasks[source] and isElement(elementMasks[source]) then
		exports.bone_attach:detachElementFromBone(elementMasks[source])
		destroyElement(elementMasks[source])
	end
	if elementGlasses[source] and isElement(elementGlasses[source]) then
		exports.bone_attach:detachElementFromBone(elementGlasses[source])
		destroyElement(elementGlasses[source])
	end
	if elementHats[source] and isElement(elementHats[source]) then
		exports.bone_attach:detachElementFromBone(elementHats[source])
		destroyElement(elementHats[source])
	end
	if elementVest[source] and isElement(elementVest[source]) then
		exports.bone_attach:detachElementFromBone(elementVest[source])
		destroyElement(elementVest[source])
	end
end)

addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),function()
	if elementHelmets[source] and isElement(elementHelmets[source]) then
		exports.bone_attach:detachElementFromBone(elementHelmets[source])
		destroyElement(elementHelmets[source])
	end
	if elementMasks[source] and isElement(elementMasks[source]) then
		exports.bone_attach:detachElementFromBone(elementMasks[source])
		destroyElement(elementMasks[source])
	end
	if elementGlasses[source] and isElement(elementGlasses[source]) then
		exports.bone_attach:detachElementFromBone(elementGlasses[source])
		destroyElement(elementGlasses[source])
	end
	if elementHats[source] and isElement(elementHats[source]) then
		exports.bone_attach:detachElementFromBone(elementHats[source])
		destroyElement(elementHats[source])
	end
	if elementVest[source] and isElement(elementVest[source]) then
		exports.bone_attach:detachElementFromBone(elementVest[source])
		destroyElement(elementVest[source])
	end
end)--]]

addEvent("firstpersonRemoveHeadCloth",true)
addEventHandler("firstpersonRemoveHeadCloth",getRootElement(),function(alpha)
	if elementHelmets[source] and isElement(elementHelmets[source]) then
		setElementAlpha(elementHelmets[source],alpha)
	end
	if elementMasks[source] and isElement(elementMasks[source]) then
		setElementAlpha(elementMasks[source],alpha)
	end
	if elementGlasses[source] and isElement(elementGlasses[source]) then
		setElementAlpha(elementGlasses[source],alpha)
	end
	if elementHats[source] and isElement(elementHats[source]) then
		setElementAlpha(elementHats[source],alpha)
	end
end)