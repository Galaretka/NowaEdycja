getResourceRootElement(getThisResource()) 
function cheackResourceRequirements ( res )
	local reason = false
	if not string.find(getServerName(),"GTA:SA DayZ") then 
		reason = "Servername incorrect! Prefix #2 is missing (GTA:SA DayZ Version)"
	end
	if not string.find(getServerName(),"| DayZ-Polska.pl |",0,true) then
		reason = "Servername incorrect! Prefix #1 is missing (| DayZ-Polska.pl |)"
	end
	if getMaxPlayers() > 80 then
		reason = "Too many slots (maximum: 80), stopping resource..."
	end
	--[[if getResourceName(getThisResource()) == "DayZ" then
		--nothing
	else
		reason = "Name of resource does not match (DayZ)!"
	end]]--
	if reason ~= false then
		cancelEvent()
		outputServerLog("Resource " .. getResourceName(res) .. " wasn't started: ("..reason..").")
		outputChatBox ( "Resource " .. getResourceName(res) .. " wasn't started: ("..reason..").", getRootElement(), 255, 255, 255 )
	end	
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), cheackResourceRequirements )

function checkPlayerSlots ()
	if getMaxPlayers() > 60 then
		stopResource (getThisResource())
	end
end
setTimer(checkPlayerSlots,10000,4)