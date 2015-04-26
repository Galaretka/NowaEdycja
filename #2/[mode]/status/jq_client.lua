theTexts = {}
theTextTimer = {}

function startRollMessage(text, r, g, b)
	if #theTexts == 5 then
		destroyTextItem()
	end
	table.insert(theTexts,{text,r,g,b})
	checkTimers()
end
addEvent("onRollMessageStart", true)
addEventHandler("onRollMessageStart", getLocalPlayer(), startRollMessage)

function startRollMessage2(head, text, r, g, b)
	if #theTexts == 5 then
		destroyTextItem()
	end
	table.insert(theTexts,{text,r,g,b})
	checkTimers()
end
addEvent("displayClientInfo", true)
addEventHandler("displayClientInfo", getLocalPlayer(), startRollMessage2)

function destroyTextItem ()
	table.remove(theTexts,1)
end

function checkTimers ()
	if isTimer(theTextTimer["destroy"]) then
		killTimer(theTextTimer["destroy"])
	end
	theTextTimer["destroy"] = setTimer(destroyTextItem,5000,5)
end

local screenWidth, screenHeight = guiGetScreenSize()
local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.3

addEventHandler("onClientRender", getRootElement(), function()
	for id, value in pairs(theTexts) do
		if (#theTexts == 1 or #theTexts == 2 or #theTexts == 3 or #theTexts == 4 or #theTexts == 5) then
			r2,g2,b2 = 5,5,5
			if id == 1 or id == 3 then
				r2,g2,b2 = 5,5,5
			end
		end
		dxDrawRectangle(screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.3, boxSpace, tocolor(r2,g2,b2,205))
		dxDrawingColorText(value[1],screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.6, screenHeight-(id-1)*boxSpace, tocolor(value[2],value[3],value[4],225),170, 1, "default-bold", "center", "center")
	end
end)