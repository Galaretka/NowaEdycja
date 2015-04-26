addEventHandler("onClientResourceStart", getResourceRootElement(), function()
	version = guiCreateLabel(0.01,0.01,1,1,"DayZ SA 0.1 PL",true)
	guiSetSize(version, guiLabelGetTextExtent(version), guiLabelGetFontHeight(version), false)
	x,y = guiGetSize(version,true)
	guiSetPosition( version, 1-x, 1-y*1.8, true )
	guiSetAlpha(version,0.5)
	setTimer(function()
		local sounds = {"sounds/music.ogg"}
		playSound(sounds[math.random(1, #sounds)])
	end,700000,0)
end)

function playerStatsClientSite()
	if getElementData(getLocalPlayer(),"logedin") then
		toggleControl ("radar", false)
		showPlayerHudComponent ("clock", false)
		if getElementData(getLocalPlayer(), "Mapa") >= 1 then
			toggleControl ("radar", true)
		end
		if getElementData(getLocalPlayer(), "Zegarek") >= 1 then
			showPlayerHudComponent ("clock", true)
		end
	end
end
setTimer(playerStatsClientSite,1000,0)

function playerZoom (key,keyState)
	if (key == "n") then
		if (getElementData(getLocalPlayer(),"Gogle noktowizyjne") > 0) then
			if nightvision then
				nightvision = false
				setPedAnimation(getLocalPlayer())
				setCameraGoggleEffect("normal")
			else 
				nightvision = true
				setTimer(setPedAnimation, 150, 1,getLocalPlayer(),"goggles","goggles_put_on",650,true,false,false,false)
				setTimer(setCameraGoggleEffect, 700, 1, "nightvision")
			end
		end
	elseif (key == "i") then
		if (getElementData(getLocalPlayer(),"Gogle na podczerwień") > 0) then
			if infaredvision then
				infaredvision = false
				setPedAnimation(getLocalPlayer())
				setCameraGoggleEffect("normal")
			else 
				infaredvision = true
				setTimer(setPedAnimation, 150, 1,getLocalPlayer(),"goggles","goggles_put_on",650,true,false,false,false)
				setTimer(setCameraGoggleEffect, 700, 1, "thermalvision")
			end
		end
	end
end
bindKey("n","down",playerZoom)
bindKey("i","up",playerZoom)

local sc = true

bindKey("-","down",function()
	if sc then
		showChat(false)
		sc = false
	else
		showChat(true)
		sc = true
	end
end)

function isObjectAroundPlayer ( thePlayer, distance, height )
	local x, y, z = getElementPosition( thePlayer )
	for i = math.random(0,360), 360, 1 do
		local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
		local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height)
		if material == 0 then
			return material,hitX, hitY, hitZ
		end
	end
	return false
end

function getPointFromDistanceRotation ( x, y, dist, angle )
    local a = math.rad( 90 - angle )
    local dx = math.cos( a ) * dist
    local dy = math.sin( a ) * dist
    return x + dx, y + dy
end

function setVolume()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 0
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 20
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 40
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 80
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then	
		value = 100
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then	
		value = 0
	elseif not getPedMoveState (getLocalPlayer()) then
		value = 20
	end
	if getElementData(getLocalPlayer(),"shooting") and getElementData(getLocalPlayer(),"shooting") > 0 then
		value = value+getElementData(getLocalPlayer(),"shooting")
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 100
	end	
	if value > 100 then
		value = 100
	end
	setElementData(getLocalPlayer(),"volume",value)
end
setTimer(setVolume,100,0)

function setVisibility()
	value = 0
	if getPedMoveState (getLocalPlayer()) == "stand" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "walk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "jog" then
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "sprint" then	
		value = 60
	elseif getPedMoveState (getLocalPlayer()) == "crouch" then	
		value = 20
	elseif not getPedMoveState (getLocalPlayer()) then	
		value = 20
	end
	if getElementData(getLocalPlayer(),"jumping") then
		value = 100
	end
	if isObjectAroundPlayer (getLocalPlayer(),2, 4 ) then
		value = 0
	end
	if isPedInVehicle (getLocalPlayer()) then
		value = 0
	end	
	setElementData(getLocalPlayer(),"visibly",value)
end
setTimer(setVisibility,100,0)

function debugJump()
	if getControlState("jump") then
		setElementData(getLocalPlayer(),"jumping",true)
		setTimer(debugJump2,650,1)
	end
end
setTimer(debugJump,100,0)

function debugJump2()
	setElementData(getLocalPlayer(),"jumping",false)
end

function updatePlayTime()
	if getElementData(getLocalPlayer(),"logedin") then
		local playtime = getElementData(getLocalPlayer(),"alivetime")
		setElementData(getLocalPlayer(),"alivetime",playtime+1)	
	end	
end
setTimer(updatePlayTime, 60000, 0)