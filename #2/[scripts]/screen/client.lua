local x1, y1, z1 = getCameraMatrix()
wh, hy = guiGetScreenSize()

function createBlackwhite()
	dxUpdateScreenSource(screenSource)
	dxDrawImage(0, 0, wh, hy, blackwhite)
end

function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end
	return t
end

function createMotion()	
	local x2, y2, z2 = getCameraMatrix()
	local d = getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
	sx2, sy2 = wh/2, hy/2
	local dx = x1 - x2
	local dy = y1 - y2
	local dz = z1 - z2
	if getPedOccupiedVehicle(getLocalPlayer()) then
		multiplier = 0.0018
	else
		multiplier = 0.0028
	end
	dxSetShaderValue(motion, "BlurAmount", d*multiplier)
	dxSetShaderValue(motion, "Angle", findRotation(dx, dx, dx, dz))
	dxSetRenderTarget()
	dxUpdateScreenSource(screenSrc)
	dxDrawImage(0, 0, wh, hy, motion)
	x1, y1, z1 =  getCameraMatrix()
end
