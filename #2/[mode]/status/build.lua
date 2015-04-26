function addPlayerStats(player,data,value)
	if (data == "calories") then
		local current = getElementData(player,data)
		if current + value > 1000 then
			setElementData(player,data,1000)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
	elseif (data == "liquid") then
		local current = getElementData(player,data)
		if not current then
		    local current = getElementData(player,data)
		end 
		if current + value > 1000 then
			setElementData(player,data,1000)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
	elseif (data == "blood") then
		local current = getElementData(player,data)
		if current + value > 5000 then
			setElementData(player,data,5000)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
	elseif (data == "temperature") then
		local current = getElementData(player,data)
		if current + value > 41 then
			setElementData(player,data,41)
		elseif 	current + value < 35 then
			setElementData(player,data,35)
		else
			setElementData(player,data,current+value)
		end
	end
end