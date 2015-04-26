addEventHandler("onClientResourceStart", resourceRoot, function()
	showPlayerHudComponent ("radar", false)
	shader = dxCreateShader("images/radar.fx")
	radar = dxCreateTexture("images/radar.jpg")
	dxSetShaderValue(shader, "sPicTexture", radar)
	dxSetShaderValue(shader, "sMaskTexture", radar)
	showGPS(false)
end)

mapX = 0.01
mapY = 0.76
playerX = mapX+0.075
playerY = mapY+0.1082
gpsX = mapX-0.005
gpsY = mapY-0.008

function createGPS()
	if getTickCount() % 3000 < 2000 then
		dxSetShaderValue(shader, "sMaskTexture", radar)
	end
	local x, y = getElementPosition(getLocalPlayer())
	x = (x)/6000
	y = (y)/-6000
	dxSetShaderValue(shader, "gUVPosition", x, y)
	dxSetShaderValue(shader, "gUVScale", 1/15.5, 1/15.5)
	dxSetShaderValue(shader, "gUVRotAngle", 135.075)
	local wx, hy = guiGetScreenSize()
	dxDrawImage(wx*mapX, hy*mapY, wx*0.16, hy*0.23, shader)
	dxDrawImage(wx*playerX, hy*playerY, wx*0.009, hy*0.0135, "images/player.png")
	dxDrawImage(wx*gpsX, hy*gpsY, wx*0.17, hy*0.245, "images/gps.png")
end

function showGPS(show)
	if show then
		addEventHandler("onClientRender", getRootElement(), createGPS)
		show = false
	else
		removeEventHandler("onClientRender", getRootElement(), createGPS)
		show = true
	end
end
--mapX = 0.01--[[лев.ниж.угол]]
--mapX = 0.4--[[ниж.серед]]
--mapX = 0.82--[[прав.ниж.угол]]