function useItems(itemName,itemInfo)
	if itemInfo == "Wypij" then
		if watter then
			triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"liquid")
			watter = false
			food = false
			setTimer(function()
				watter = true
				food = true
			end,3750,1)
		end
	elseif itemInfo == "Zjedz" then
		if food then
			triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"calories")
			food = false
			watter = false
			setTimer(function()
				food = true
				watter = true
			end,3750,1)
		end
	elseif itemInfo == "Otwórz" then
		triggerServerEvent("onPlayerAmmoOpen",getLocalPlayer(),itemName)
	elseif itemName == "Namiot" then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	elseif (itemName == "Pusta butelka po wodzie") or (itemName == "Pusta manierka") then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)
	elseif itemInfo == "Podpal" then
		triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)
	elseif itemInfo == "Koktajl Mołotowa" then
		setElementData(getLocalPlayer(),"Pełny kanister",getElementData(getLocalPlayer(),"Pusta butelka")-1)
		setElementData(getLocalPlayer(),"Pusta butelka",getElementData(getLocalPlayer(),"Pusta butelka")-1)
		setElementData(getLocalPlayer(),"Pusty kanister",(getElementData(getLocalPlayer(),"Koktajl Mołotowa") or 0)+1)
		setElementData(getLocalPlayer(),"Koktajl Mołotowa",(getElementData(getLocalPlayer(),"Koktajl Mołotowa") or 0)+1)
	elseif itemInfo == "Użyj przedmiotu z apteczki" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == "Mina" then
		triggerServerEvent("onPlayerPutMine",getLocalPlayer(),itemName)
	elseif itemName == "Drut kolczasty" then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == "Flara" then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)
	elseif itemInfo == "Weź pierwszą broń" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1,true)
		setElementData(getLocalPlayer(),"currentweapon_1",itemName)
		triggerEvent ("playerCurrentWeapChanged",getLocalPlayer())
	elseif itemInfo == "Weź drugą broń" then
		local curweap = getElementData(getLocalPlayer(), "currentweapon_2")
		if curweap and curweap ~= "noweap" then
			if not weapFitsInInventory(curweap,itemName) then
				triggerEvent ("displayClientInfo",getLocalPlayer(),"inventory","Aktualna broń nie mieści się w plecaku",22,255,0)
				return true
			end
		end
		setElementData(getLocalPlayer(),"currentweapon_2",itemName)
		triggerEvent ("playerCurrentWeapChanged",getLocalPlayer())
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2,false,true)
	elseif itemInfo == "Weź specjalną broń" then
		setElementData(getLocalPlayer(),"currentweapon_3",itemName)
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3,false,false,true)
	elseif (itemInfo == "Weź pistolet") then
		setElementData(getLocalPlayer(),"currentweapon_4",itemName)
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,4,false,false,false,true)
	elseif (itemName == "Kask motocyklowy") then
		setElementData(getLocalPlayer(),"Helmets",10)
		setElementData(getLocalPlayer(),"Masks",0)
		setElementData(getLocalPlayer(),"Hats",0)
	elseif (itemName == "Ракетные Авиаторы") then
		setElementData(getLocalPlayer(),"Glasses",10)
	elseif (itemName == "Respirator") then
		setElementData(getLocalPlayer(),"Masks",1)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Maska gazowa") then
		setElementData(getLocalPlayer(),"Masks",2)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Maska 'Hoxton'") then
		setElementData(getLocalPlayer(),"Masks",3)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Maska 'Dallas'") then
		setElementData(getLocalPlayer(),"Masks",4)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Maska 'Wilk'") then
		setElementData(getLocalPlayer(),"Masks",5)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Nauszniki") then
		setElementData(getLocalPlayer(),"Hats",1)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Kowbojski kapelusz") then
		setElementData(getLocalPlayer(),"Hats",2)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Czapka") then
		setElementData(getLocalPlayer(),"Hats",3)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Okrągła czapka") then
		setElementData(getLocalPlayer(),"Hats",4)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Beret" )then
		setElementData(getLocalPlayer(),"Hats",5)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Beret wojskowy") then
		setElementData(getLocalPlayer(),"Hats",6)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Panama") then
		setElementData(getLocalPlayer(),"Hats",7)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Hełm wojskowy") then
		setElementData(getLocalPlayer(),"Hats",8)
		setElementData(getLocalPlayer(),"Helmets",0)
	elseif (itemName == "Kamizelka taktyczna") then
		setElementData(getLocalPlayer(),"Vest",1)--]]
	elseif (itemName == "Torba domowa") then
		setElementData(getLocalPlayer(),"MAX_Slots",13)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-1)
		maxSlotsChanged()
	elseif (itemName == "Plecak domowej roboty") then
		setElementData(getLocalPlayer(),"MAX_Slots",20)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-1)
		maxSlotsChanged()
	elseif (itemName == "Termometr") then
		unShowNewInventory()
		showChat(false)
		showCursor(true)
		guiSetVisible(gradus_window, true)
		local number = 11
		wait = setTimer(function()
			number = number-1
			guiSetText(gradus_text, "Trwa sprawdzanie temperatury ciała.\nCzas: "..number)
			if number < 0 then
				guiSetText(gradus_text, "")
				setTimer(guiSetText,1500,1,gradus_text, "Temperatura ciała: \n"..math.round(getElementData(getLocalPlayer(),"temperature"),2).."°C")
			end
		end, 1000, 12)
	elseif (itemName == "GPS") then
		if show then
			exports.gps:showGPS(false)
			show = false
		else
			if inventoryShowing then
				unShowNewInventory()
			end
			exports.gps:showGPS(true)
			show = true
		end
	elseif (itemName == "Latarka na głowę*") then
		setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)-1)
		setElementData(getLocalPlayer(),"Latarka na głowę",(getElementData(getLocalPlayer(),"Latarka na głowę") or 0)+1)
		setElementData(getLocalPlayer(),"Bateria",(getElementData(getLocalPlayer(),"Bateria") or 0)+1)
		triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
	elseif (itemName == "Latarka*") then
		setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)-1)
		setElementData(getLocalPlayer(),"Latarka",(getElementData(getLocalPlayer(),"Latarka") or 0)+1)
		setElementData(getLocalPlayer(),"Bateria",(getElementData(getLocalPlayer(),"Bateria") or 0)+1)
		triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
	end
end