--Gamemode Script Name
addons = "DayZ POLSKA"
addons2 = "Dayz POLSKA"
function addAddonInfo (name,description)
	setGameType (addons)
	setMapName (addons2)
end

--night addon
function nightAddon1 ()
	if gameplayVariables["enablenight"] then 
		addAddonInfo ("night","Natąpiła pora nocna.")
	end
end

function nightAddon () 
	setTimer(nightAddon1,10000,1)
end
nightAddon () 

--Load Addons
function loadAddons( res )
	for resourceKey, resourceValue in ipairs(getResources()) do
		local name = getResourceName(resourceValue)
		if string.find(name,"addon_") then
			startResource(resourceValue)
		end
	end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), loadAddons )

function unloadAddons ( res )
	for resourceKey, resourceValue in ipairs(getResources()) do
		local name = getResourceName(resourceValue)
		if string.find(name,"addon_") then
			stopResource(resourceValue)
		end
	end
end
addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()), unloadAddons )

--Addon System
--Functions