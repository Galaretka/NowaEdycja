--checking
setTimer(function()--brokenbone
	if getElementData(getLocalPlayer(), "logedin") then
		if getElementData(getLocalPlayer(), "brokenbone") then
			if not isPedDucked(getLocalPlayer()) then end
			toggleControl("jump", false)
			toggleControl("sprint", false)
		else
			toggleControl("jump", true)
			toggleControl("sprint", true)
		end
	end
end,3000,0)

setTimer(function()--pain
	if getElementData(getLocalPlayer(), "logedin") then
		if getElementData(getLocalPlayer(),"pain") then
			exports.screen:fxScreenSA("motion", true)
		else
			exports.screen:fxScreenSA("motion", false)
		end
	end
end,3000,0)

setTimer(function()--cold
	if getElementData(getLocalPlayer(), "logedin") then
		if getElementData(getLocalPlayer(),"temperature") <= 36 then
			setElementData(getLocalPlayer(),"cold",true)
			setElementData(getLocalPlayer(), "grippe", true)
		end
	end
end,3000,0)

setTimer(function()--bleeding/blood/kill
	if getElementData(getLocalPlayer(), "logedin") then
		if (getElementData(getLocalPlayer(),"bleeding") > 1) then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-getElementData(getLocalPlayer(),"bleeding"))
		end
		if (getElementData(getLocalPlayer(),"blood") < 1) then
			if not getElementData(getLocalPlayer(),"isDead") then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),false,false)
			end
		end
		if (getElementData(getLocalPlayer(),"blood") < 1000) then
			exports.screen:fxScreenSA("blackwhite", true)
		else
			exports.screen:fxScreenSA("blackwhite", false)
		end
	end
end,3000,0)

setTimer(function()--inHandcuffs
	if getElementData(getLocalPlayer(), "logedin") then
		local x,y,z = getElementPosition(getLocalPlayer())
		if getElementData(getLocalPlayer(),"inHandcuffs") then
			pedCol = createColSphere(x,y,z,1.25)
			attachElements (pedCol,getLocalPlayer(),0,0,0)
			toggleAllControls(false)
			setPedAnimation(getLocalPlayer())
		else
			if pedCol and isElement(pedCol) then
				detachElements(pedCol,getLocalPlayer())
				destroyElement(pedCol)
				toggleAllControls(true)
			end
		end
	end
end,3000,0)

setTimer(function()--bleeding effect
	if getElementData(getLocalPlayer(),"logedin") then
		local x,y,z = getElementPosition(getLocalPlayer())
		for i,player in ipairs(getElementsByType("player")) do
			local bleeding = getElementData(player,"bleeding") or 0
			if bleeding > 0 then
				local px,py,pz = getPedBonePosition (player,3)
				local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
				if pdistance <= 120 then
					fxAddBlood(px,py,pz,0,0,0,bleeding,0)
				end
			end
		end
	end
end,500,0)

setTimer(function()--grippe
    if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"grippe") then
			setPedAnimation(getLocalPlayer(),"FOOD","EAT_Vomit_P")
			local x,y,z = getElementPosition(getLocalPlayer())
			local cough = {"data/cough_0.ogg","data/cough_1.ogg","data/cough_2.ogg"}
			local sound = playSound3D(cough[math.random(1, #cough)],x,y,z,false)
			setSoundMaxDistance(sound,20)
			setTimer(function()
				setPedAnimation(getLocalPlayer())
			end,2000,1)
		end
    end
end,90000,0)