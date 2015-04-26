addEventHandler("onClientRender", getRootElement(), function()
--	for k,player in ipairs(getElementsByType("player")) do
		local rotcam = math.rad (360 - getPedCameraRotation (getLocalPlayer()))
		local xpos,ypos,zpos = getPedBonePosition (getLocalPlayer(), 8)
		local xlook,ylook,zlook = xpos - 300*math.sin(rotcam), ypos + 300*math.cos(rotcam), zpos
		setPedLookAt (getLocalPlayer(), xlook, ylook, zlook, -1)
--	end
end)

function updateCamera()
	x,y,z,tx,ty,tz =  getCameraMatrix()
	newangle = ((360-math.deg(math.atan2((x-tx),(y-ty))))%360)-180
	setPedRotation(getLocalPlayer(),newangle)
end

function strafe(key, keystate)
	if keystate == "up" then
--		addEventHandler("onClientRender",getRootElement(),updateCamera)
	else
--		addEventHandler("onClientRender",getRootElement(),updateCamera)
	end
end
--bindKey("lalt", "both", strafe)--]]