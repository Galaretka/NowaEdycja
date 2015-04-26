addCommandHandler("Reload weapon", function()
	local task = getPedSimplestTask(localPlayer)
	if ((task == "TASK_SIMPLE_JUMP" or task == "TASK_SIMPLE_IN_AIR" or task == "TASK_SIMPLE_LAND") and not doesPedHaveJetPack(localPlayer)) then return end
	if (isControlEnabled("jump")) then
		toggleControl("jump", false)
		addEventHandler("onClientRender", getRootElement(), enableJump)
	end
	triggerServerEvent("onPlayerReload", localPlayer)
end)
bindKey("r","down","Reload weapon")

local frames = 0

function enableJump()
	if (frames >= 3) then
		toggleControl("jump", true)
		removeEventHandler("onClientRender", getRootElement(), enableJump)
		frames = 0
	else
		frames = frames + 1
	end
end

function createaroow(weapon, _, _, hx, hy, hz, element)
	local weaponZ = getElementData(source,"currentweapon_1")
	if weapon == 33 then
		if weaponZ == "Kusza" then
			prot = getPedRotation(source)
			local offsetRot = math.rad(prot+90)
			local vx = hx + 0 * math.cos(offsetRot)
			local vy = hy + 0 * math.sin(offsetRot)
			local vz = hz + 0.88
			local vrot = prot+270
			if isElement(element) then
				element = hitElement
			end
			triggerServerEvent("createArrow",getLocalPlayer(),vx,vy,vz,vrot,hitElement)
			triggerEvent("refreshInventoryManual",source)
		end
	end
	if (weapon > 22 and weapon < 34 and weapon ~= 33) then
		local hit = {"data/iron1.mp3","data/iron14.mp3","data/whine_4.ogg","data/whine01.ogg","data/whine02.ogg"}
		hitS = playSound3D(hit[math.random(1, #hit)],hx,hy,hz,false)
		setSoundMaxDistance(hitS, 25)
		setSoundVolume(hitS, 0.4)
	end
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), createaroow)