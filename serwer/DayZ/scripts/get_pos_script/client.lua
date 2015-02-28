function position()
	local x,y,z = getElementPosition(localPlayer)
	local posString = tostring(x)..","..tostring(y)..","..tostring(z)
	outputChatBox(posString, 0, 255, 0)
	setClipboard(posString)
	outputChatBox("Your position has been copied to your clipboard.", 0, 255, 0)
end
addCommandHandler("getpos",position)