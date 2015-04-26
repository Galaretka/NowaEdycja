local hello = false
local sit = false
local handup = false
local fuck = false
local lie = false
anim = true

function animHello(player)
	if anim then
		if hello then
			setPedAnimation(player,false)
			hello = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"ped","endchat_03",nil,true,false,false,true)
			setPedWeaponSlot(player, 0)
			hello = true
		end	
	end	
end

function animSit(player)
	if anim then
		if sit then
			setPedAnimation(player,false)
			sit = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"BEACH","ParkSit_M_loop",nil,true,false,false,false)
			sit = true
		end
	end
end

function animHandup(player)
	if anim then
		if handup then
			setPedAnimation (player,false)
			handup = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"SHOP","SHP_Rob_HandsUp",nil,true,false,false,false)
			setPedWeaponSlot(player, 0)
			handup = true
		end
	end
end

function animFuck(player)
	if anim then
		if fuck then
			setPedAnimation(player,false)
			fuck = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"SHOP","ROB_Loop",nil,true,false,false,true)
			fuck = true
		end
	end
end

function animLie(player)
	if anim then
		if lie then
			setPedAnimation(player,false)
			lie = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"WUZI","CS_Dead_Guy",nil,false,false,false,true)
			lie = true
		end
	end
end

local test = false
function animTest(player)
	if anim then
		if test then
			setPedAnimation(player,false)
			test = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"BSKTBALL","BBALL_def_jump_shot",nil,false,false,false,true)
			test = true
		end
	end
end
local test2 = false
function animTest2(player)
	if anim then
		if test2 then
			setPedAnimation(player,false)
			test2 = false
		else
			if isPedInVehicle(player) then return end
			if isElementInWater(player) then return end
			setPedAnimation(player,"BIKES","BIKEs_Back",nil,false,false,false,true)
			test2 = true
		end
	end
end

function bindTheKeys()
	bindKey(source,"F1","down",animHello)
	bindKey(source,"F2","down",animHandup)
	bindKey(source,"F3","down",animSit)
	bindKey(source,"F4","down",animFuck)
	bindKey(source,"X","down",animLie)
--	bindKey(source,"J","down",animTest)
--	bindKey(source,"k","down",animTest2)
end
addEventHandler("onPlayerLogin",getRootElement(),bindTheKeys)