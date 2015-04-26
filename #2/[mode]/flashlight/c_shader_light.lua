local isLightOn = false
-- don't mess with the tables
local flashlight = {}
local light_shader = {}
local shader_jaroovka = {}
local shader_rays = {}
local shader_null = {}
local isFlon = {}  -- a list of players with fl turned on (for local client)
local isFLen = {}  -- a list of players with fl enabled (for local client)
local fLInID = {}  -- a list fl of inerior ID (for local client)
local lightNumber = 0

-- Below this line you can edit as You wish

local isSynced = true -- disable if you want to disable light effect synchro (only localPlayer's flashlight effect remains)
local maxLights = 1 -- how many light effects can be streamed in at once (besides localPlayer's)
local alterAttach = false -- true=прикреWypij на голову
local disableFLTex = false -- true=невидимый фонарь
local autoEnableFL = false -- true=the player gets the flashlight without writing commands

local switch_key = 'l' -- define the key that switches the light effect
local lightColor = {0.9,0.9,0.65,1.0} -- rgba color of the projected light, light rays and the lightbulb
local effectRange = 40 -- effect max distance 120
local isFakeBump = false -- apply fake bumps to the light texture
local isLightDir=true -- the vertexes oposite to the lightsource will NOT be affected (turn off for custom maps !!)
local lightDirAcc = 0.2 -- the accuracy of the above (0.01-1)
local maxEffectSwitch=60 -- max distance between camera and player coords form which the effect is switched off
local DistFade = {110, 80, 49, 1} -- [0]MaxEffectFade,[1]MinEffectFade,[2]MaxFlashFade,[3]MinFlashFade
local objID = 15060  -- the object we are going to replace (interior building shadow in this case)
--local theTikGap = 0.8 -- here you set how many seconds to wait after switching the flashlight on/off

--local getLastTick = getTickCount ( )-(theTikGap*1000)
local shader_null = dxCreateShader ( "shaders/shader_null.fx",0,0,false )
local textureCube = dxCreateTexture ( "textures/cubebox.dds")

---------------------------------------------------------------------------------------------------
local removeList = {
						"",												-- unnamed
						"basketball2","skybox_tex", "drvin_screen",		-- other
						"flashlight*","crackedground*",				-- other
						"roughcornerstone*",		     			-- other
						"fireba*",						-- fire
						"muzzle_texture*",					-- gunshots
						"font*","radar*",					-- hud
						"*headlight*",	 					-- vehicles
						"*shad*",						-- shadows
						"coronastar","coronamoon","coronaringa",		-- coronas
						"lunar",						-- moon
						"tx*",							-- grass effect
						"lod*",							-- lod models
						"cj_w_grad",						-- checkpoint texture
						"*cloud*",						-- clouds
						"*smoke*",						-- smoke
						"sphere_cj",						-- nitro heat haze mask
						"particle*",						-- particle skid and maybe others
						"water*","sw_sand", "coral",				-- sea
						"boatwake*","splash_up","carsplash_*",			-- splash
						"gensplash","wjet4","bubbles",				-- splash
						"blood*",						-- blood

					}

---------------------------------------------------------------------------------------------------
--Updates light positions and rotation of the light direction
function renderLight()
	for index,thisPed in ipairs(getElementsByType("player")) do
		if light_shader[thisPed] then
			xx1, yy1, zz1, lxx1, lyy1, lzz1,rl = getCameraMatrix()
			if (alterAttach) then
				x1, y1, z1 = getPedBonePosition ( thisPed, 5 )
				lx1, ly1, lz1 = getPedBonePosition ( thisPed, 8 )
				local yaw = math.atan2(lx1-x1,ly1-y1)
				yaw = yaw-math.rad(7)
				local pitch = (math.atan2(lz1-z1, math.sqrt(((lx1-x1) * (lx1-x1)) + ((ly1-y1) * (ly1-y1))))) 
				pitch = pitch - math.rad(20)
				local roll = 0
				local movx=xx1-x1 
				local movy=yy1-y1
				local movz=zz1-z1	   
				dxSetShaderValue ( light_shader[thisPed],"rotate",yaw,roll,pitch)	
				dxSetShaderValue(light_shader[thisPed],"alterPosition",movx,movy,movz)
			else
				x1, y1, z1 = getPedBonePosition ( thisPed, 24 )
				lx1, ly1, lz1 = getPedBonePosition ( thisPed, 25 )
				local yaw = math.atan2(lx1-x1,ly1-y1) 
				local pitch = (math.atan2(lz1-z1, math.sqrt(((lx1-x1) * (lx1-x1)) + ((ly1-y1) * (ly1-y1))))) 
				local roll = 0
				local movx=xx1-x1 
				local movy=yy1-y1
				local movz=zz1-z1	   
				dxSetShaderValue ( light_shader[thisPed],"rotate",yaw,roll,pitch)	
				dxSetShaderValue(light_shader[thisPed],"alterPosition",movx,movy,movz)
			end
		end											
	end
end

---------------------------------------------------------------------------------------------------

function createFlashlightModel(thisPed)
	if not flashlight[thisPed] then	
		flashlight[thisPed] = createObject(objID,0,0,0,0,0,0,true)
		if disableFLTex and shader_null then
			engineApplyShaderToWorldTexture ( shader_null, "flashlight_COLOR", flashlight[thisPed] )	
			engineApplyShaderToWorldTexture ( shader_null, "flashlight_L", flashlight[thisPed] )	
		end
		setElementAlpha(flashlight[thisPed],254)
		if (alterAttach) then
			exports.bone_attach:attachElementToBone(flashlight[thisPed],thisPed,1,0,-0.062,0.18,-100,0,0)
		else
			exports.bone_attach:attachElementToBone(flashlight[thisPed],thisPed,12,0,0.015,0.2,0,0,0)
		end
	end
end

function destroyFlashlightModel(thisPed)
	if flashlight[thisPed] then			
		exports.bone_attach:detachElementFromBone(flashlight[thisPed])
		if disableFLTex and shader_null then
			engineRemoveShaderFromWorldTexture ( shader_null, "*", flashlight[thisPed] )
		end
		destroyElement(flashlight[thisPed])
		flashlight[thisPed]=nil
	end
end

---------------------------------------------------------------------------------------------------

function createWorldLightShader(thisPed)
	if light_shader[thisPed] or ((isSynced==false) and (thisPed~=localPlayer)) then return end
	if (thisPed~=localPlayer) then lightNumber = lightNumber + 1 end
	light_shader[thisPed] = dxCreateShader ( "shaders/shader_light.fx",1,effectRange,true,"world,object,vehicle,ped")
	if not light_shader[thisPed] then return end
	dxSetShaderValue ( light_shader[thisPed],"sCubeTexture", textureCube )
	dxSetShaderValue ( light_shader[thisPed],"isLightDir", isLightDir )
	dxSetShaderValue ( light_shader[thisPed],"isFakeBump", isFakeBump )
	dxSetShaderValue ( light_shader[thisPed],"lightColor",lightColor)
	dxSetShaderValue ( light_shader[thisPed],"lightDirAcc", lightDirAcc )
	dxSetShaderValue ( light_shader[thisPed],"DistFade",DistFade)
	engineApplyShaderToWorldTexture ( light_shader[thisPed], "*" )
	-- remove light effect from the texture list
	for _,removeMatch in ipairs(removeList) do
		engineRemoveShaderFromWorldTexture ( light_shader[thisPed], removeMatch )	
	end	
	-- lazy re-apply list
	engineApplyShaderToWorldTexture ( light_shader[thisPed], "ws_tunnelwall2smoked" )
	engineApplyShaderToWorldTexture ( light_shader[thisPed], "shadover_law" )
	engineApplyShaderToWorldTexture ( light_shader[thisPed], "greenshade_64" )
	---------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------------------------------------------------
	engineApplyShaderToWorldTexture ( light_shader[thisPed], "ws_carparck2" )
end

function destroyWorldLightShader(thisPed)
	if light_shader[thisPed] then
		if (thisPed~=localPlayer) then lightNumber = lightNumber - 1 end
		engineRemoveShaderFromWorldTexture ( light_shader[thisPed], "*" )
		destroyElement ( light_shader[thisPed] )
		light_shader[thisPed]=nil
	end
end

---------------------------------------------------------------------------------------------------

function createFlashLightShader(thisPed)
	if not flashlight[thisPed] then return false end
	if not shader_jaroovka[thisPed] or shader_rays[thisPed] then
		shader_jaroovka[thisPed]=dxCreateShader("shaders/shader_jaroovka.fx",1,0,false)
		shader_rays[thisPed]=dxCreateShader("shaders/flash_light_rays.fx",1,0,true)
		if not shader_jaroovka[thisPed] or not shader_rays[thisPed] then
			outputChatBox( "Could not create shader. Please use debugscript 3" )
		end		
		engineApplyShaderToWorldTexture ( shader_jaroovka[thisPed],"flashlight_L", flashlight[thisPed] )
		engineApplyShaderToWorldTexture ( shader_rays[thisPed], "flashlight_R", flashlight[thisPed] )	
		dxSetShaderValue (shader_jaroovka[thisPed],"lightColor",lightColor)
		dxSetShaderValue (shader_rays[thisPed],"lightColor",lightColor)
	end
end

function destroyFlashLightShader(thisPed)
	if shader_jaroovka[thisPed] or shader_rays[thisPed] then
		destroyElement(shader_jaroovka[thisPed])
		destroyElement(shader_rays[thisPed])
		shader_jaroovka[thisPed]=nil
		shader_rays[thisPed]=nil
	end
end

---------------------------------------------------------------------------------------------------

function playSwitchSound(this_player)
	pos_x,pos_y,pos_z=getElementPosition (this_player)
	local flSound = playSound3D("sounds/switch.wav", pos_x, pos_y, pos_z, false) 
	setSoundMaxDistance(flSound,40)
	setSoundVolume(flSound,0.6)
end

function flashLightEnable(isEN,this_player)
	if isEN==true then
		isFLen[this_player]=isEN	
	else
		isFLen[this_player]=isEN	
	end
end

function flashLightSwitch(isON,this_player)
if isElementStreamedIn(this_player) and isFLen[this_player] then  playSwitchSound(this_player) end
if isON then
		isFlon[this_player]=true
	else
		isFlon[this_player]=false
	end
end


function whenPlayerQuits(this_player)
	destroyWorldLightShader(this_player) 
	destroyFlashlightModel(this_player) 
	destroyFlashLightShader(this_player)  
end

---------------------------------------------------------------------------------------------------
-- streamig in/out the light effect

function streamInAndOutFlEffects()
	for index,this_player in ipairs(getElementsByType("player")) do
		local cam_x, cam_y, cam_z, _, _, _ = getCameraMatrix()
		local player_x,player_y,player_z = getElementPosition(this_player)
		--outputChatBox(isFlon[this_player])
		local getDist = getDistanceBetweenPoints3D(cam_x,cam_y,cam_z,player_x,player_y,player_z)
		if  isElementStreamedIn(this_player) and getDist<=maxEffectSwitch then 
		
			if (not light_shader[this_player]) and (isFlon[this_player]==true) then
				if ((lightNumber<=maxLights) or (this_player==localPlayer)) then
					createWorldLightShader(this_player)
				end
			end 
			if light_shader[this_player] and isFlon[this_player]==false then	
			destroyWorldLightShader(this_player)	
			end
		end
		if (not isElementStreamedIn(this_player) or getDist>maxEffectSwitch) and light_shader[this_player] and isFlon[this_player]==true then 
			destroyWorldLightShader(this_player)		
		end
	end
--outputChatBox(lightNumber.." of "..maxLights)
end

function streamInAndOutFlModel()
	for index,this_player in ipairs(getElementsByType("player")) do
		if fLInID[this_player]==nil then
			fLInID[this_player]=0
		end
		if isElementStreamedIn(this_player) and isFLen[this_player]==true and fLInID[this_player]~=getElementInterior(this_player) then
			triggerServerEvent("onPlayerGetInter",this_player)
			end
		if  isElementStreamedIn(this_player) and not flashlight[this_player] and isFLen[this_player]==true then
			createFlashlightModel(this_player)
			if fLInID[this_player]~=nil then
				setElementInterior ( flashlight[this_player], fLInID[this_player])
			end
		end
		if  isElementStreamedIn(this_player) and flashlight[this_player] and isFLen[this_player]==false then
			destroyFlashlightModel(this_player)
		end
		if isElementStreamedIn(this_player) and not shader_rays[this_player] and isFlon[this_player]==true then 
			createFlashLightShader(this_player)
		end
		if (isElementStreamedIn(this_player) or not isElementStreamedIn(this_player)) and shader_rays[this_player] and isFlon[this_player]==false then 
			destroyFlashLightShader(this_player)
		end
	end
end

function getPlayerInteriorFromServer(this_player,interiorID)
	if flashlight[this_player] then
		fLInID[this_player]=interiorID
		if flashlight[this_player] then
			setElementInterior ( flashlight[this_player], fLInID[this_player])
		end
	end
end
---------------------------------------------------------------------------------------------------

function toggleLight()
	if isPedInVehicle(getLocalPlayer()) then return end
	--if (getTickCount ( ) - getLastTick < theTikGap*1000) then outputChatBox('FlashLight: Wait '..theTikGap..' seconds.',255,0,100) return end
	if isLightOn==false then isLightOn=true else isLightOn=false end
	triggerServerEvent("onSwitchLight",getLocalPlayer(),isLightOn)
	--getLastTick = getTickCount ( )
end

-- start or stop using flashlight
function toggleFlashLight1()
	local source = source
	alterAttach = false
	disableFLTex = false
	triggerServerEvent("onSwitchLight",source,false)
	triggerServerEvent("onSwitchEffect",source,true)
	bindKey(switch_key,"down",toggleLight)
end
addEvent("onPlayerFlashlightOn",true)
addEventHandler("onPlayerFlashlightOn",getRootElement(),toggleFlashLight1)

function toggleFlashLight3()
	local source = source
	alterAttach = true
	disableFLTex = true
	triggerServerEvent("onSwitchLight",source,false)
	triggerServerEvent("onSwitchEffect",source,true)
	bindKey(switch_key,"down",toggleLight)
end
addEvent("onPlayerHeadFlashlightOn",true)
addEventHandler("onPlayerHeadFlashlightOn",getRootElement(),toggleFlashLight3)

function toggleFlashLight2()
	local source = source
	triggerServerEvent("onSwitchLight",source,false)
	triggerServerEvent("onSwitchEffect",source,false)
	isLightOn = false
	destroyWorldLightShader(source) 
	destroyFlashlightModel(source) 
	destroyFlashLightShader(source)
	unbindKey(switch_key,"down",toggleLight)
end
addEvent("onPlayerFlashlightOff",true)
addEventHandler("onPlayerFlashlightOff",getRootElement(),toggleFlashLight2)

---------------------------------------------------------------------------------------------------

addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource()), function()
	addEventHandler("onClientPreRender", root, renderLight)
	addEventHandler("onClientRender", root, streamInAndOutFlEffects)
	addEventHandler("onClientRender", root, streamInAndOutFlModel)
	triggerServerEvent("onPlayerStartRes",getLocalPlayer())
end)

---------------------------------------------------------------------------------------------------

addEvent( "flashOnPlayerEnable", true )
addEvent( "flashOnPlayerQuit", true )
addEvent( "flashOnPlayerSwitch", true )
addEvent( "flashOnPlayerInter", true)
addEventHandler( "flashOnPlayerQuit", getResourceRootElement( getThisResource()), whenPlayerQuits)
addEventHandler( "flashOnPlayerSwitch", getResourceRootElement( getThisResource()), flashLightSwitch)
addEventHandler( "flashOnPlayerEnable", getResourceRootElement( getThisResource()), flashLightEnable)
addEventHandler( "flashOnPlayerInter", getResourceRootElement( getThisResource()), getPlayerInteriorFromServer)