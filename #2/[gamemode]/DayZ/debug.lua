--------------------------------------------------------
--GUI + STATS						 				  --
--------------------------------------------------------

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

statsLabel = {}

statsWindows = guiCreateStaticImage(0.81, 0.20, 0.19, 0.21, "images/scrollmenu_1.png",true)
guiSetAlpha(statsWindows,0.8)
 
-- ZOMBIES (A/T) 1
statsLabel["zombies1"] = guiCreateLabel(0.71, 0.45, 0.27, 0.09, "0/0", true, statsWindows)
guiSetFont(statsLabel["zombies1"], "default-bold-small")
setElementData(statsLabel["zombies1"],"identifikation","zombies")

-- ZOMBIES KILLEDS 1
statsLabel["zombieskilled1"] = guiCreateLabel(0.71, 0.40, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["zombieskilled1"], "default-bold-small")
setElementData(statsLabel["zombieskilled1"],"identifikation","zombieskilled")

-- HEADSHOTS 1
statsLabel["headshots1"] = guiCreateLabel(0.71, 0.35, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["headshots1"], "default-bold-small")
setElementData(statsLabel["headshots1"],"identifikation","headshots")

-- HUMANITY 1
statsLabel["humanity1"] = guiCreateLabel(0.71, 0.20, 0.27, 0.09,  "2500", true, statsWindows)
guiSetFont(statsLabel["humanity1"], "default-bold-small")
setElementData(statsLabel["humanity1"],"identifikation","humanity")

-- BANDITS KILLEDS 1 
statsLabel["banditskilled1"] = guiCreateLabel(0.71, 0.30, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["banditskilled1"], "default-bold-small")
setElementData(statsLabel["banditskilled1"],"identifikation","banditskilled")

-- ALIVETIME 1 
statsLabel["alivetime1"] = guiCreateLabel(0.71, 0.60, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["alivetime1"], "default-bold-small")
setElementData(statsLabel["alivetime1"],"identifikation","alivetime")

-- FOOD 1 
statsLabel["food1"] = guiCreateLabel(0.71, 0.65, 0.27, 0.09, "100", true, statsWindows)
guiSetFont(statsLabel["food1"], "default-bold-small")
setElementData(statsLabel["food1"],"identifikation","calories")

-- SHSHDA 1 
statsLabel["thirst1"] = guiCreateLabel(0.71, 0.70, 0.27, 0.09, "100", true, statsWindows)
guiSetFont(statsLabel["thirst1"], "default-bold-small")
setElementData(statsLabel["thirst1"],"identifikation","liquid")

-- Slots 1 
statsLabel["MAX_Slots1"] = guiCreateLabel(0.71, 0.75, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["MAX_Slots1"], "default-bold-small")
setElementData(statsLabel["MAX_Slots1"],"identifikation","MAX_Slots")

-- Skin 1 
statsLabel["skin1"] = guiCreateLabel(0.71, 0.80, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["skin1"], "default-bold-small")
setElementData(statsLabel["skin1"],"identifikation","skin")

-- kasa 1 
statsLabel["kasa1"] = guiCreateLabel(0.71, 0.85, 0.27, 0.09, "0", true, statsWindows)
guiSetFont(statsLabel["kasa1"], "default-bold-small")
setElementData(statsLabel["kasa1"],"identifikation","skin")

-- MURDERS 1
statsLabel["murders1"] = guiCreateLabel(0.71, 0.25, 0.27, 0.09,"0", true, statsWindows)
guiSetFont(statsLabel["murders1"], "default-bold-small")
setElementData(statsLabel["murders1"],"identifikation","murders")

-- BLOOD 1
statsLabel["blood1"] = guiCreateLabel(0.71, 0.50, 0.27, 0.09,  "12000", true, statsWindows)
guiSetFont(statsLabel["blood1"], "default-bold-small")
guiLabelSetColor(statsLabel["blood1"], 255, 255, 255)
setElementData(statsLabel["blood1"],"identifikation","blood")

-- TEMP 1
statsLabel["temperature1"] = guiCreateLabel(0.71, 0.55, 0.27, 0.09, "37°C", true, statsWindows)
guiSetFont(statsLabel["temperature1"], "default-bold-small")
guiLabelSetColor(statsLabel["temperature1"], 255, 255, 255)
setElementData(statsLabel["temperature1"],"identifikation","temperature")


-- FACEBOOK
statsLabel["face"] = guiCreateLabel(0.36, 0.93, 0.84, 0.11, "www.DayZ-POLSKA.eu", true, statsWindows)
guiSetFont(statsLabel["face"], "default-small")
guiLabelSetColor(statsLabel["face"], 255, 255, 255)

-- DEBUG MONITOR
statsLabel["debug"] = guiCreateLabel(0.33, 0.00, 0.84, 0.09, "Debug Monitor", true, statsWindows)
guiSetFont(statsLabel["debug"], "default-bold-small")
guiLabelSetColor(statsLabel["debug"], 255, 255, 255)

-- SURVIVOR
statsLabel["survivor"] = guiCreateLabel(0.06, 0.09, 0.31, 0.09, "", true, statsWindows)
guiSetFont(statsLabel["survivor"], "default-bold-small")
guiLabelSetColor(statsLabel["survivor"], 255, 255, 255)

--Zombies (A/T)
statsLabel["zombies"] = guiCreateLabel(0.06, 0.45, 0.41, 0.09, "Zombi (z/W):", true, statsWindows)
guiSetFont (statsLabel["zombies"], "default-bold-small")
guiLabelSetColor(statsLabel["zombies"], 255, 255, 255)

--Zombies  Killed
statsLabel["zombieskilled"] = guiCreateLabel(0.06, 0.40, 0.41, 0.09, "Zabitych zombi:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["zombieskilled"],"center")
guiSetFont (statsLabel["zombieskilled"], "default-bold-small" )
guiLabelSetColor(statsLabel["zombieskilled"], 255, 255, 255)

--ALIVETIME
statsLabel["alivetime"] = guiCreateLabel(0.06, 0.60, 0.41, 0.09, "Czas zycia:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["alivetime"],"center")
guiSetFont (statsLabel["alivetime"], "default-bold-small" )
guiLabelSetColor(statsLabel["alivetime"], 255, 255, 255)

--FOOD
statsLabel["food"] = guiCreateLabel(0.06, 0.65, 0.41, 0.09, "Glod:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["food"],"center")
guiSetFont (statsLabel["food"], "default-bold-small" )
guiLabelSetColor(statsLabel["food"], 255, 255, 255)

--SHSDA
statsLabel["thirst"] = guiCreateLabel(0.06, 0.70, 0.41, 0.09, "Pragnienie:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["thirst"],"center")
guiSetFont (statsLabel["thirst"], "default-bold-small" )
guiLabelSetColor(statsLabel["thirst"], 255, 255, 255)

--SLOTS
statsLabel["MAX_Slots"] = guiCreateLabel(0.06, 0.75, 0.41, 0.09, "Plecak:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["MAX_Slots"],"center")
guiSetFont (statsLabel["MAX_Slots"], "default-bold-small" )
guiLabelSetColor(statsLabel["MAX_Slots"], 255, 255, 255)

--SKIN
statsLabel["skin"] = guiCreateLabel(0.06, 0.80, 0.41, 0.09, "Skin:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["skin"],"center")
guiSetFont (statsLabel["skin"], "default-bold-small" )
guiLabelSetColor(statsLabel["skin"], 255, 255, 255)

--kasa
statsLabel["kasa"] = guiCreateLabel(0.06, 0.85, 0.41, 0.09, "Kasa:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["kasa"],"center")
guiSetFont (statsLabel["kasa"], "default-bold-small" )
guiLabelSetColor(statsLabel["kasa"], 255, 255, 255)

--Headshots
statsLabel["headshots"] = guiCreateLabel(0.06, 0.35, 0.41, 0.12, "Trafien w glowe:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["headshots"],"center")
guiSetFont (statsLabel["headshots"], "default-bold-small" )
guiLabelSetColor(statsLabel["headshots"], 255, 255, 255)

--Murders
statsLabel["murders"] = guiCreateLabel(0.06, 0.25, 0.41, 0.09, "Morderstw:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["murders"],"center")
guiSetFont (statsLabel["murders"], "default-bold-small" )
guiLabelSetColor(statsLabel["murders"], 255, 255, 255)

--Bandits Killed
statsLabel["banditskilled"] = guiCreateLabel(0.06, 0.30, 0.41, 0.12,"Zabitych bandytow:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["banditskilled"],"center")
guiSetFont (statsLabel["banditskilled"], "default-bold-small" )
guiLabelSetColor(statsLabel["banditskilled"], 255, 255, 255)

--Blood
statsLabel["blood"] = guiCreateLabel(0.06, 0.50, 0.41, 0.09, "Krew:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["blood"],"center")
guiSetFont (statsLabel["blood"], "default-bold-small" )
guiLabelSetColor(statsLabel["blood"], 255, 255, 255)

--Temperature
statsLabel["temperature"] = guiCreateLabel(0.06, 0.55, 0.41, 0.09, "Temperatura:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["temperature"],"center")
guiSetFont (statsLabel["temperature"], "default-bold-small" )
guiLabelSetColor(statsLabel["temperature"], 255, 255, 255)

--Humanity
statsLabel["humanity"] = guiCreateLabel(0.06, 0.20, 0.31, 0.09, "Ludzkosc:",true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["humanity"],"center")
guiSetFont (statsLabel["humanity"], "default-bold-small" )
guiLabelSetColor(statsLabel["humanity"], 255, 255, 255)

--Name
statsLabel["name"] = guiCreateLabel(0.36, 0.09, 0.62, 0.09, "                       "..getPlayerName(getLocalPlayer()),true,statsWindows)
--guiLabelSetHorizontalAlign (statsLabel["name"],"center")
guiSetFont (statsLabel["name"], "default-bold-small" )
guiLabelSetColor(statsLabel["name"], 255, 255, 255)
setElementData(statsLabel["name"],"identifikation","name")

if getElementData(localPlayer,"logedin") then
    guiSetVisible(statsWindows,true)
else
    guiSetVisible(statsWindows,false)
end

function showDebugMonitor ()
playSound("sounds/0.mp3")
    local visible = guiGetVisible(statsWindows)
    guiSetVisible(statsWindows,not visible)
end
bindKey("F5","down",showDebugMonitor)

function showDebugMintorOnLogin ()
    guiSetVisible(statsWindows,true)
end
addEvent("onClientPlayerDayZLogin", true)
addEventHandler("onClientPlayerDayZLogin", root, showDebugMintorOnLogin)

function refreshDebugMonitor()
    if getElementData(getLocalPlayer(),"logedin") then
    
    local value = getElementData(getRootElement(), "zombiesalive") or 0
    local value2 = getElementData(getRootElement(), "zombiestotal") or 0
    guiSetText(statsLabel["zombies1"], " " .. value .. "/" .. value2)

    local value = getElementData(getLocalPlayer(),getElementData(statsLabel["zombieskilled1"],"identifikation"))
        guiSetText(statsLabel["zombieskilled1"]," "..value)
        
        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["headshots1"],"identifikation"))
        guiSetText(statsLabel["headshots1"]," "..value)
        
        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["banditskilled1"],"identifikation"))
        guiSetText(statsLabel["banditskilled1"]," "..value)
        
        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["murders1"],"identifikation"))
        guiSetText(statsLabel["murders1"]," "..value)
        
        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["blood1"],"identifikation"))
        guiSetText(statsLabel["blood1"]," "..value)

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["alivetime1"],"identifikation"))
        guiSetText(statsLabel["alivetime1"]," "..value)

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["food1"],"identifikation"))
        guiSetText(statsLabel["food1"]," "..value.."%")

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["thirst1"],"identifikation"))
        guiSetText(statsLabel["thirst1"]," "..value.."%")

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["MAX_Slots1"],"identifikation"))
        guiSetText(statsLabel["MAX_Slots1"]," "..value.." slot")

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["skin1"],"identifikation"))
        guiSetText(statsLabel["skin1"],"ID "..value)

        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["temperature1"],"identifikation"))
        guiSetText(statsLabel["temperature1"],""..math.round(value,2).."°C")
        
        local value = getElementData(getLocalPlayer(),getElementData(statsLabel["humanity1"],"identifikation"))
        guiSetText(statsLabel["humanity1"]," "..math.round(value,2))
        
        guiSetText(statsLabel["name"]," "..getPlayerName(getLocalPlayer()))
		
		guiSetText(statsLabel["kasa1"]," "..getPlayerMoney(getLocalPlayer()))
    end         
end
setTimer(refreshDebugMonitor,2000,0)