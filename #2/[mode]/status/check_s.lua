function checkStat()
	for i,player in ipairs(getElementsByType("player")) do
		local liquid = 0
		local calories = 0
		if getElementData(player,"logedin") then
			liquid = liquid-getElementData(player, "temperature")/2.6
			calories = calories-getElementData(player, "temperature")/2.5
		end
		addPlayerStats(player,"liquid",liquid)
		addPlayerStats(player, "calories",calories)
	end
end
setTimer(checkStat,60000,0)

function checkStat2()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			local liquid = 0
			local calories = 0
			if getControlState (player,"sprint") then
				liquid = liquid-getElementData(player,"MAX_Slots")/2.6
				calories = calories-getElementData(player,"MAX_Slots")/2.5
			end
			addPlayerStats(player,"liquid",liquid)
			addPlayerStats(player, "calories",calories)
			local blood = 0
			local stomach = (getElementData(player,"liquid")+getElementData(player,"calories"))/2
			if stomach < 400 then
				blood = 15
			elseif stomach < 300 then
				blood = 25
			elseif stomach < 200 then
				blood = 45
			elseif stomach < 100 then
				blood = 85
			elseif stomach < 1 then
				blood = 5000
			else
				blood = 0
			end
			setElementData(player,"blood",getElementData(player,"blood")-blood)
			if stomach > 600 and getElementData(player,"blood") < 5000 then
				addPlayerStats(player,"blood",50)
			end

			local temperature = 0
			if isElementInWater(player) then
				if getElementData(player, "temperature") > 36.3 and getElementData(player, "temperature") < 36.9 then
					temperature = -0.05
				end
			end
			if getControlState(player, "sprint") then
				if getElementData(player, "temperature") > 36.5 and getElementData(player, "temperature") < 36.9 then
					temperature = 0.01
				end
			end
			addPlayerStats(player, "temperature", temperature)
			if getElementData(player, "temperature") >= 40 then
				setElementData(player,"blood",getElementData(player,"blood")-100)
			end

		end
	end
end
setTimer(checkStat2,10000,0)

function checkAilment()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player, "logedin") then
			local temperature = 0
			if getElementData(player,"sepsis") then
				temperature = 0.015
			elseif getElementData(player, "grippe") then
				temperature = 0.01
			elseif getElementData(player, "worm") then
				temperature = 0.008
			else
				temperature = 0
			end
			addPlayerStats(player, "temperature", temperature)
			local liquid = 0
			local calories = 0
			if getElementData(player,"sepsis") then
				liquid = -11
				calories = -10
			elseif getElementData(player, "grippe") then
				liquid = -7
				calories = -6
			elseif getElementData(player, "worm") then
				liquid = -17
				calories = -16
			else
				liquid = 0
				calories = 0
			end
			addPlayerStats(player,"liquid",liquid)
			addPlayerStats(player, "calories",calories)
		end
	end
end
setTimer(checkAilment,60000,0)