weap1use = true
weap2use = true
weap3use = true
weap4use = true
watter = true
food = true
show = true
test = true
flighet = true
flighet2 = true

function useBoxes(itemName,itemInfo)
	if itemInfo == "Wypij" then
		if watter then
			triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"liquid")
			watter = false
			food = false
			setTimer(function()
				watter = true
				food = true
			end,3500,1)
		end
	elseif itemInfo == "Zjedz" then
		if food then
			triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"calories")
			food = false
			watter = false
			setTimer(function()
				food = true
				watter = true
			end,3500,1)
		end
	elseif itemName == "Namiot" then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	elseif (itemName == "Pusta butelka po wodzie") or (itemName == "Pusta manierka") then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)
	elseif itemInfo == "Użyj przedmiotu z apteczki" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == "Mina" then
		triggerServerEvent("onPlayerPutMine",getLocalPlayer(),itemName)
	elseif itemName == "Drut kolczasty" then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == "Flara" then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)
	elseif itemInfo == "Weź pierwszą broń" then
		if weap1use then
			triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1,true)
			setElementData(getLocalPlayer(),"currentweapon_1",itemName)
			triggerEvent ("playerCurrentWeapChanged",getLocalPlayer())
			weap1use = false
		else
			setPedWeaponSlot(getLocalPlayer(), 0)
			weap1use = true
		end
	elseif itemInfo == "Weź drugą broń" then
		if weap2use then
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
			weap2use = false
		else
			setPedWeaponSlot(getLocalPlayer(), 0)
			weap2use = true
		end
	elseif itemInfo == "Weź specjalną broń" then
		if weap3use then
			setElementData(getLocalPlayer(),"currentweapon_3",itemName)
			triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3,false,false,true)
			weap3use = false
		else
			setPedWeaponSlot(getLocalPlayer(), 0)
			weap3use = true
		end
	elseif itemInfo == "Weź pistolet" then
		if weap4use then
			setElementData(getLocalPlayer(),"currentweapon_4",itemName)
			triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,4,false,false,false,true)
			weap4use = false
		else
			setPedWeaponSlot(getLocalPlayer(), 0)
			weap4use = true
		end
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
				setTimer(guiSetText,1500,1,gradus_text, "Temperatura ciala: \n"..math.round(getElementData(getLocalPlayer(),"temperature"),2).."°C")
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
		if flighet2 then
			triggerEvent("onPlayerHeadFlashlightOn",getLocalPlayer())
			flighet = false
			flighet2 = false
		else
			triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
			flighet = true
			flighet2 = true
		end
	elseif (itemName == "Latarka*") then
		if flighet then
			triggerEvent("onPlayerFlashlightOn",getLocalPlayer())
			flighet = false
			flighet2 = false
		else
			triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
			flighet = true
			flighet2 = true
		end
	end
end

gradus_window = guiCreateStaticImage(0.40, 0.35, 0.20, 0.25, "images/90.png", true)
gradus_but = exports.design:standaloneButton(0.35, 0.84, 0.30, 0.12, "Blisko", 12, gradus_window)
gradus_text = exports.design:standaloneInfo(0.03, 0.1, 0.93, 0.68, "#temperature", 12, gradus_window)
guiSetVisible(gradus_window, false)

addEventHandler("onClientGUIClick", getRootElement(), function()
	if (source == gradus_but) then
		showChat(true)
		showCursor(false)
		guiSetVisible(gradus_window, false)
		if isTimer(wait) then killTimer(wait) end
		guiSetText(gradus_text, "#temperature")
		destroyElement(gradus_window)
	end
end)