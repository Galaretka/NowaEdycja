local spalten = {}
local spalteGuiImage = {}
local spalteGuiText = {}
local dxText = ""

local mainWeapsTable = {"М4А1","AKM","CZ550","IZH-43","Blaze 95","Mosin 9130","SKS","Sporter 22","Kusza"}

local optionsTable = {
	["player"] = {
		{"Zastosuj śr. przeciwbólowy"},
		{"Narzuć"},
		{"Daj morfinę"},
	},
}

spalten[1] = ""
spalten[2] = ""
spalten[3] = ""
spalten[4] = ""
spalten[5] = ""
spalten[6] = ""
spalteGuiImage[1] = guiCreateStaticImage(0.03, 0.3, 0.1, 0.025,"data/default.png",true)
spalteGuiImage[2] = guiCreateStaticImage(0.03, 0.325, 0.1, 0.025,"data/default.png",true)
spalteGuiImage[3] = guiCreateStaticImage(0.03, 0.35, 0.1, 0.025,"data/default.png",true)
spalteGuiImage[4] = guiCreateStaticImage(0.03, 0.375, 0.1, 0.025,"data/default.png",true)
spalteGuiImage[5] = guiCreateStaticImage(0.03, 0.4, 0.1, 0.025,"data/default.png",true)
spalteGuiImage[6] = guiCreateStaticImage(0.03, 0.425, 0.1, 0.025,"data/default.png",true)
spalteGuiText[1] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[1],true,spalteGuiImage[1])
spalteGuiText[2] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[2],true,spalteGuiImage[2])
spalteGuiText[3] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[3],true,spalteGuiImage[3])
spalteGuiText[4] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[4],true,spalteGuiImage[4])
spalteGuiText[5] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[5],true,spalteGuiImage[5])
spalteGuiText[6] = guiCreateLabel(0.1,0.08,0.9,0.92,spalten[6],true,spalteGuiImage[6])
guiSetVisible(spalteGuiImage[1],false)
guiSetVisible(spalteGuiImage[2],false)
guiSetVisible(spalteGuiImage[3],false)
guiSetVisible(spalteGuiImage[4],false)
guiSetVisible(spalteGuiImage[5],false)
guiSetVisible(spalteGuiImage[6],false)

function lootText(show, text,img)
	dxShow = show
	dxText = text
	dxImg = img
end

addEventHandler("onClientRender", getRootElement(), function()
	if dxShow == false then return end
	local wx, hy = guiGetScreenSize()
	local x, y = wx/2, hy/2
	dxDrawText(dxText, x-60, y, 0, 0, tocolor(230, 230, 230, 230), 1, "sans", "left", "top", false, false, true, false, false)
	if dxImg then
		dxDrawImage(x-25, y, 40, 25, "data/weap.png")
	end
end)

function showClientMenuItem(arg1,arg2,arg3,arg4)
	local number = 0
	if arg1 == "Take" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		guiSetAlpha(spalteGuiImage[number],0.0)
		if number == 1 then
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
		end
		setElementData(spalteGuiText[number],"usedItem",arg2)
	end
	if arg1 == "stop" then
		disableMenu()
--		refreshLoot(false)
	end
	if arg1 == "Helicrashsite" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		if number == 1 then
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
		end
		setElementData(spalteGuiText[number],"usedItem","helicrashsite")
	end
	if arg1 == "Hospitalbox" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		if number == 1 then
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
		end
		setElementData(spalteGuiText[number],"usedItem","hospitalbox")
	end
	if arg1 == "Vehicle" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		guiLabelSetColor (spalteGuiText[number],235,215,5)
		setElementData(spalteGuiText[number],"markedMenuItem",true)
		setElementData(spalteGuiText[number],"usedItem","vehicle")
		if getElementData(getElementData(arg3,"parent"),"tent") then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Свернуть")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
			setElementData(spalteGuiText[number],"usedItem","tent")
			return
		end
		if getElementHealth(arg3) < 1000 and getElementHealth(arg3) >= 50 and getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Napraw")
			setElementData(spalteGuiText[number],"usedItem","repairvehicle")
		end
	end
	if arg1 == "Player" then
	   if arg2 and localPlayer then 
		if getElementData(arg2,"bleeding") > 0 and getElementData(getLocalPlayer(),"Bandaż") > 0 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Narzuć")
			setElementData(spalteGuiText[number],"usedItem","bandage")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end
	   end 
	   if localPlayer then
		if getElementData(getLocalPlayer(),"Kajdanki") > 0 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Skuj kajdankami")
			setElementData(spalteGuiText[number],"usedItem","handcuffed")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end
	   end
	   if arg2 and localPlayer then
		if getElementData(arg2,"blood") < 4500 and getElementData(getLocalPlayer(),"Pakiet krwi") >= 1 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Transfuzja krwi")	
			setElementData(spalteGuiText[number],"usedItem","giveblood")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end
	   end
	end
	if arg1 == "Dead" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		if number == 1 then
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
		end
		setElementData(spalteGuiText[number],"usedItem","dead")
		number = number+1--
		setElementData(spalteGuiText[number],"usedItem","deadreason")
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Czas zgonu")
		number = number+1--
		setElementData(spalteGuiText[number],"usedItem","hidebody")
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Ukryj ciało")
		guiLabelSetColor(spalteGuiText[number],255,255,255)
		setElementData(spalteGuiText[number],"markedMenuItem",false)
	end
	if arg1 == "fireplace" then
		if getElementData(getLocalPlayer(),"Surowe mięso") > 0 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Upiec mięso")
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
			setElementData(spalteGuiText[number],"usedItem","fireplace")
		end
	end
	if arg1 == "patrol" then
		if getElementData(getLocalPlayer(),"Pusty kanister") > 0 then
		    --local col = getElementData(getLocalPlayer(),"parent")
			local litras = getElementData(source,"patrollitras")
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Napełnij "..tonumber(litras).."/100")
			setElementData(spalteGuiText[number],"usedItem","patrolstation")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end
		if getElementData(getLocalPlayer(),"Pusta butelka") > 0 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Napełnij butelkę")
			setElementData(spalteGuiText[number],"usedItem","patrolbottle")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end
	end
--[[	if arg1 == "upwaterbottle" then
		if isElementInWater(getLocalPlayer()) and getElementData(getLocalPlayer(),"Pusta butelka po wodzie") > 0 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Napełnij butelkę")
			setElementData(spalteGuiText[number],"usedItem","upwaterbottle")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end	
		end	
	end]]
	if arg1 == "wirefence" then
		if getElementData(getLocalPlayer(),"Narzędzia") >= 1 then
			number = number+1
			guiSetVisible(spalteGuiImage[number],true)
			guiSetText(spalteGuiText[number],"Zbierz (Potrzebne narzędzia)")
			setElementData(spalteGuiText[number],"usedItem","wirefence")
			if number == 1 then
				guiLabelSetColor (spalteGuiText[number],235,215,5)
				setElementData(spalteGuiText[number],"markedMenuItem",true)
			end
		end	
	end
	if arg1 == "Gear" then
		number = number+1
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"Plądruj")
		guiSetAlpha(spalteGuiImage[number],0.0)
		if number == 1 then
			guiLabelSetColor (spalteGuiText[number],235,215,5)
			setElementData(spalteGuiText[number],"markedMenuItem",true)
		end
		setElementData(spalteGuiText[number],"usedItem","itemloot")
	end
end
addEvent("showClientMenuItem",true)
addEventHandler("showClientMenuItem",getLocalPlayer(),showClientMenuItem)

function PlayerScrollMenu (key,keyState,arg)
	if ( keyState == "down" ) then
		if not guiGetVisible(spalteGuiImage[2]) then
			return
		end
		if arg == "up" then 
			if getElementData(spalteGuiText[1],"markedMenuItem") then
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false) 
				setElementData(spalteGuiText[6],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[6],235,215,5)
				guiLabelSetColor (spalteGuiText[5],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255) 
				guiLabelSetColor (spalteGuiText[1],255,255,255) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[4],255,255,255)	
            elseif getElementData(spalteGuiText[2],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false) 
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[1],235,215,5) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255) 
				guiLabelSetColor (spalteGuiText[4],255,255,255) 
				guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[3],"markedMenuItem") then 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[2],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[2],235,215,5) 
				guiLabelSetColor (spalteGuiText[1],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[4],255,255,255) 
				guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[4],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false) 
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[3],235,215,5) 
				guiLabelSetColor (spalteGuiText[1],255,255,255) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[4],255,255,255)
                guiLabelSetColor (spalteGuiText[5],255,255,255)	
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[5],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[4],235,215,5) 
				guiLabelSetColor (spalteGuiText[1],255,255,255) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)
            elseif getElementData(spalteGuiText[6],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[5],235,215,5) 
				guiLabelSetColor (spalteGuiText[1],255,255,255) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[4],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)				   
            end 
        elseif arg == "down" then 
            if getElementData(spalteGuiText[1],"markedMenuItem") then 
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
                setElementData(spalteGuiText[3],"markedMenuItem",false) 
                setElementData(spalteGuiText[4],"markedMenuItem",false)
                setElementData(spalteGuiText[5],"markedMenuItem",false)
	            setElementData(spalteGuiText[6],"markedMenuItem",false) 
                setElementData(spalteGuiText[2],"markedMenuItem",true) 
                guiLabelSetColor (spalteGuiText[2],235,215,5) 
                guiLabelSetColor (spalteGuiText[1],255,255,255) 
                guiLabelSetColor (spalteGuiText[3],255,255,255)
                guiLabelSetColor (spalteGuiText[4],255,255,255)
                guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)					
            elseif getElementData(spalteGuiText[2],"markedMenuItem") then 
                setElementData(spalteGuiText[2],"markedMenuItem",false) 
                setElementData(spalteGuiText[3],"markedMenuItem",false) 
                setElementData(spalteGuiText[4],"markedMenuItem",false) 
                setElementData(spalteGuiText[5],"markedMenuItem",false) 
	            setElementData(spalteGuiText[6],"markedMenuItem",false) 
                setElementData(spalteGuiText[3],"markedMenuItem",true) 
                guiLabelSetColor (spalteGuiText[3],235,215,5) 
                guiLabelSetColor (spalteGuiText[2],255,255,255) 
                guiLabelSetColor (spalteGuiText[1],255,255,255) 
                guiLabelSetColor (spalteGuiText[4],255,255,255)
				guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[3],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false)
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[4],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[4],235,215,5) 
				guiLabelSetColor (spalteGuiText[2],255,255,255) 
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[1],255,255,255)
				guiLabelSetColor (spalteGuiText[5],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[4],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false)
				setElementData(spalteGuiText[4],"markedMenuItem",false)
				setElementData(spalteGuiText[1],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[5],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[5],235,215,5) 
				guiLabelSetColor (spalteGuiText[2],255,255,255)
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[1],255,255,255)
				guiLabelSetColor (spalteGuiText[4],255,255,255)
				guiLabelSetColor (spalteGuiText[6],255,255,255)	
            elseif getElementData(spalteGuiText[5],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false)
				setElementData(spalteGuiText[4],"markedMenuItem",false)
				setElementData(spalteGuiText[5],"markedMenuItem",false)
				setElementData(spalteGuiText[1],"markedMenuItem",false) 
				setElementData(spalteGuiText[6],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[6],235,215,5)
				guiLabelSetColor (spalteGuiText[1],255,255,255)
				guiLabelSetColor (spalteGuiText[2],255,255,255)
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[4],255,255,255)
				guiLabelSetColor (spalteGuiText[5],255,255,255)
            elseif getElementData(spalteGuiText[6],"markedMenuItem") then 
				setElementData(spalteGuiText[2],"markedMenuItem",false) 
				setElementData(spalteGuiText[3],"markedMenuItem",false)
				setElementData(spalteGuiText[4],"markedMenuItem",false)
				setElementData(spalteGuiText[5],"markedMenuItem",false)
				setElementData(spalteGuiText[6],"markedMenuItem",false) 
				setElementData(spalteGuiText[1],"markedMenuItem",true) 
				guiLabelSetColor (spalteGuiText[1],235,215,5)
				guiLabelSetColor (spalteGuiText[6],255,255,255)
				guiLabelSetColor (spalteGuiText[2],255,255,255)
				guiLabelSetColor (spalteGuiText[3],255,255,255)
				guiLabelSetColor (spalteGuiText[4],255,255,255)
				guiLabelSetColor (spalteGuiText[5],255,255,255)
			end 
        end
	end
end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenu, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenu, "down" )

function disableMenu()
	guiSetVisible(spalteGuiImage[1],false)
	guiSetVisible(spalteGuiImage[2],false)
	guiSetVisible(spalteGuiImage[3],false)
	guiSetVisible(spalteGuiImage[4],false)
	guiSetVisible(spalteGuiImage[5],false)
	guiSetVisible(spalteGuiImage[6],false)
	setElementData(spalteGuiText[1],"markedMenuItem",false)
	setElementData(spalteGuiText[2],"markedMenuItem",false)
	setElementData(spalteGuiText[3],"markedMenuItem",false)
	setElementData(spalteGuiText[4],"markedMenuItem",false)
	setElementData(spalteGuiText[5],"markedMenuItem",false)
	setElementData(spalteGuiText[6],"markedMenuItem",false)
	lootText(false,"","")
end
addEvent("disableMenu",true)
addEventHandler("disableMenu",getLocalPlayer(),disableMenu)

function getPlayerInCol(tab)
	for theKey,thePlayer in ipairs(tab) do
		if thePlayer ~= getLocalPlayer() then
			return true
		end
	end
	return false
end

isInFirePlace = false
function onPlayerTargetPickup (theElement)
	if theElement == getLocalPlayer() then
		if getElementData(source,"parent") == getLocalPlayer() then return end
		local player = getPlayerInCol(getElementsWithinColShape ( source, "player" ))
		if getPedOccupiedVehicle(getLocalPlayer()) then
			return
		end
		isInFirePlace = false
		setElementData(spalteGuiText[1],"markedMenuItem",true)
		setElementData(spalteGuiText[2],"markedMenuItem",false)
		setElementData(spalteGuiText[3],"markedMenuItem",false)
		setElementData(spalteGuiText[4],"markedMenuItem",false)
		setElementData(spalteGuiText[5],"markedMenuItem",false)
		setElementData(spalteGuiText[6],"markedMenuItem",false)
		guiLabelSetColor (spalteGuiText[1],235,215,5)
		guiLabelSetColor (spalteGuiText[2],255,255,255)
		guiLabelSetColor (spalteGuiText[3],255,255,255)
		guiLabelSetColor (spalteGuiText[4],255,255,255)
		guiLabelSetColor (spalteGuiText[5],255,255,255)
		guiLabelSetColor (spalteGuiText[6],255,255,255)
		if getElementData(source,"player") then
			showClientMenuItem("Player",getElementData(source,"parent"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			return
		end
		if player then
			return
		end
		if getElementData(source,"patrolstation") or getElementData(source,"patrolbottle") then
			showClientMenuItem("patrol")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			lootText(true,"Stacja paliw")
			return
		end
		if getElementData(source,"wirefence") and getElementData(getLocalPlayer(),"Narzędzia") > 0 then
			showClientMenuItem("wirefence")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			lootText(true,"Drut kolczasty")
			return
		end
		if getElementData(source,"fireplace") and getElementData(getLocalPlayer(), "Surowe mięso") > 0 then
			showClientMenuItem("fireplace")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			lootText(true,"Ognisko")
			isInFirePlace = true
			return
		end
		if getElementData(source,"deadman") then
			showClientMenuItem("Dead",getElementData(source,"playername"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			lootText(true,"",true)
			return
		end
		if getElementData(source,"item") then
			showClientMenuItem("Take",getElementData(source,"item"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			lootText(true, "Plądrujesz: "..getElementData(source,"item"))
			return
		end
		if getElementData(source,"helicrash") then
			showClientMenuItem("Helicrashsite","helicrash")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			lootText(true,"Rozbity śmigłowiec")
			return
		end
		if getElementData(source,"hospitalbox") then
			showClientMenuItem("Hospitalbox","hospitalbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			lootText(true,"Skrzynki medyczne")
			return
		end
		if getElementData(source,"vehicle") then
			if not getElementData(source,"deadVehicle") then
				showClientMenuItem("Vehicle",(getVehicleName(getElementData(source,"parent")) or "Namiot"),getElementData(source,"parent"))
				setElementData(getLocalPlayer(),"currentCol",source)
				setElementData(getLocalPlayer(),"loot",true)
				lootText(true,"Pojazd: "..(getVehicleName(getElementData(source,"parent")) or "Namiot"))
				return
			end
		end
		if getElementData(source,"itemloot") then
			showClientMenuItem("Gear")
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"currentCol",source)
			return
		end
		showClientMenuItem("stop")
	end
end
addEventHandler("onClientColShapeHit",getRootElement(),onPlayerTargetPickup)

function onPlayerTargetPickup (theElement)
	if theElement == getLocalPlayer() then
		local players = getElementsWithinColShape ( source, "player" )
		if players == getLocalPlayer() then end
		showClientMenuItem("stop")
		setElementData(getLocalPlayer(),"loot",false)
		setElementData(getLocalPlayer(),"currentCol",false)
		disableMenu()
		isInFirePlace = false
	end
end
addEventHandler("onClientColShapeLeave",getRootElement(),onPlayerTargetPickup)

function fireRaiseTemperature ()
	if isInFirePlace then
		if getElementData(getLocalPlayer(),"temperature") < 37.8 then
			setElementData(getLocalPlayer(),"temperature",getElementData(getLocalPlayer(),"temperature")+0.1)
		end
	end
end
setTimer(fireRaiseTemperature,10000,0)

function onPlayerPressMiddleMouse (key,keyState)
	if ( keyState == "down" ) then
		local x,y,z = getElementPosition(getLocalPlayer())
		if not guiGetVisible(spalteGuiText[1]) then return end
		local itemName = getMenuMarkedItem()
		if itemName == "helicrashsite" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerEvent("showInventoryManual", getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "itemloot" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerEvent("showInventoryManual", getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "wirefence" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeWirefence",getLocalPlayer(),getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "hospitalbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerEvent("showInventoryManual", getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "hidebody" then
			triggerServerEvent("hideBodyClient", getLocalPlayer()) 
			disableMenu()
			return
		end
		if itemName == "vehicle" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerEvent("showInventoryManual", getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "repairvehicle" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("repairVehicle",getLocalPlayer(),getElementData(col,"parent"))
			playSound3D("data/repair_0.ogg",x,y,z,false)
			disableMenu()
			return
		end
		if itemName == "tent" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeTent",getLocalPlayer(),getElementData(col,"parent"))
			playSound3D("data/tentpack_0.ogg",x,y,z,false)
			disableMenu()
			return
		end
		if itemName == "fireplace" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("addPlayerCookMeat",getLocalPlayer())
			local cook = {"data/cook_0.ogg","data/cook_1.ogg","data/cook_2.ogg"}
			playSound3D(cook[math.random(1, #cook)],x,y,z,false)
			disableMenu()
			return
		end
		if itemName == "bandage" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "giveblood" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
			disableMenu()
			return
		end
		---------------------------------------------------------------------------------------------------------------------------
		if itemName == "handcuffed" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "dead" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerEvent("showInventoryManual", getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "deadreason" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			outputChatBox(getElementData(col,"deadreason"),255,255,255,true)
			return
		end
		if itemName == "patrolstation" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local litras = getElementData(col,"patrollitras")
			if tonumber(litras) >= 20 then 
			setElementData(col,"patrollitras",litras-20)
			setElementData(getLocalPlayer(),"Pusty kanister",getElementData(getLocalPlayer(),"Pusty kanister")-1)
			setElementData(getLocalPlayer(),"Pełny kanister",(getElementData(getLocalPlayer(),"Pełny kanister") or 0)+1)
			triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolstation","Napełniasz kanister!",22,255,0)
			playSound3D("data/refuel_0.ogg",x,y,z,false)
			disableMenu()
			return
			else 
			triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolstation","Nie masz pustego kanistra!",225,20,0)
			end
		end
		if itemName == "patrolbottle" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local litras = getElementData(col,"patrollitras")
			if tonumber(litras) > 20 then 
			setElementData(col,"patrollitras",litras-20)
			setElementData(getLocalPlayer(),"Pusta butelka",getElementData(getLocalPlayer(),"Pusta butelka")-1)
			setElementData(getLocalPlayer(),"Koktajl Mołotowa",(getElementData(getLocalPlayer(),"Koktajl Mołotowa") or 0)+1)
			triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolbottle","Napełniasz butelkę!",22,255,0)
			disableMenu()
			return
						else 
			triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolstation","Butelka ma benzynę!",22,255,0)
			end
		end
--[[		if itemName == "upwaterbottle" then
			triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),"Butelka wody")
			disableMenu()
			return
		end]]
		if exports.dayz_i:isToolbeltItem(itemName) and exports.dayz_i:itemFitsInInventory(itemName) then
			if getElementData ( getLocalPlayer(), "notReadyToTakeFromGround" ) then return true end
			setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", true )
			local col = getElementData(getLocalPlayer(),"currentCol")
			if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then return end
			x, y, z = getElementPosition(getLocalPlayer())
			if pcount ~= nil and pcount < getTickCount() then
				pcount = getTickCount() + 2000
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				x, y, z = getElementPosition(getLocalPlayer())
				return false
			elseif pcount == nil then
				pcount = getTickCount() + 2000
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				x, y, z = getElementPosition(getLocalPlayer())
				return false
			end
			local x1, y1, z1 = getElementPosition(getLocalPlayer())
			if x1 ~= x or y1 ~= y or z1 ~= z then
				pcount = nil
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				return false
			end
			pcount = nil
			triggerServerEvent("onPlayerTakeItemFromGround",getLocalPlayer(),itemName,col)
			disableMenu()
			return
		end
		-- @Plecakи
		if itemName == "Детский Plecak" or itemName == "Torba domowa" or itemName == "Plecak domowej roboty" or itemName == "Plecak"  or itemName == "Plecak na polowanie"  or itemName == "Plecak górski" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("onPlayerTakeItemFromGround",getLocalPlayer(),itemName,col)
			disableMenu()
			return
		end	
		local mainweap = exports.dayz_i:checkIfMainWeap(itemName)
		--if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then	
		if exports.dayz_i:itemFitsInInventory(itemName) or mainweap then
			if getElementData ( getLocalPlayer(), "notReadyToTakeFromGround" ) then return true end
			setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", true )
	--	if exports.dayz_i:getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then	
			local weapname = getElementData ( getLocalPlayer(), "currentweapon_1" )
			if weapname and weapname ~= "noweap" and mainweap then
				triggerServerEvent("playerDropAItem",getLocalPlayer(),weapname)
				triggerServerEvent("removeNewWeapon",getLocalPlayer())
				setElementData ( getLocalPlayer(), weapname, 0 )
				for i, v in ipairs ( mainWeapsTable ) do
					if ( getElementData ( getLocalPlayer(), v ) or 0 ) > 0 then
						triggerServerEvent("playerDropAItem",getLocalPlayer(),weapname,getElementData(getLocalPlayer(), v))
					end
				end
			end
			local col = getElementData(getLocalPlayer(),"currentCol")
			if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then return end
			x, y, z = getElementPosition(getLocalPlayer())
			if pcount ~= nil and pcount < getTickCount() then
				pcount = getTickCount() + 2000
				x, y, z = getElementPosition(getLocalPlayer())
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				return false
			elseif pcount == nil then
				pcount = getTickCount() + 2000
				x, y, z = getElementPosition(getLocalPlayer())
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				return false
			end
			local x1, y1, z1 = getElementPosition(getLocalPlayer())
			if x1 ~= x or y1 ~= y or z1 ~= z then
				pcount = nil
				setElementData ( getLocalPlayer(), "notReadyToTakeFromGround", false )
				return false
			end
			pcount = nil --тут
			triggerServerEvent("onPlayerTakeItemFromGround",getLocalPlayer(),itemName,col,mainweap)
			disableMenu()
		else
			triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Inwentarz jest pełny!!",255,22,0)
		end
	end
end
bindKey("e", "down", onPlayerPressMiddleMouse)
bindKey("mouse3", "down", onPlayerPressMiddleMouse)

function getMenuMarkedItem() 
	for i,guiItem in ipairs(spalteGuiText) do
		if getElementData(guiItem,"markedMenuItem") then
			return getElementData(guiItem,"usedItem") 
		end
	end
end

function playerPressedKey(button, press)
    if (press) then
		if button == "w" or button == "a" or button == "s" or button == "d" then
			local anim,anim2 = getPedAnimation (getLocalPlayer())
			if anim == "SCRATCHING" and anim2 == "sclng_r" then
				triggerServerEvent("onClientMovesWhileAnimation",getLocalPlayer())
			end	
		end
    end
end
addEventHandler("onClientKey", getRootElement(), playerPressedKey)