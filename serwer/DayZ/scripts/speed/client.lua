--[[
    # Resource Name
	  Rage's Free Vehicle HUD
	# Author
	  Rage
	# Date
	  25.04.2014
	# Copyright (c)
	  If you edit it, then please respect me and keep
	  the credits.
--]]

local screenW,screenH = guiGetScreenSize()
local resW,resH = 1370,720
local sW,sH =  (screenW/resW), (screenH/resH)

function drawVehicleHUD()
    local vehicle = getPedOccupiedVehicle( getLocalPlayer() )
	    if ( vehicle ) then
		    local speedX, speedY, speedZ = getElementVelocity ( vehicle  )
		    local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
		    local KMH = math.floor(actualSpeed*180)	
		        if ( getElementHealth( vehicle ) >= 1000 ) then
		            vehiclehealth = 100
		        else
		            vehiclehealth = math.floor(getElementHealth ( vehicle )/10)
		        end
                    dxDrawRectangle(1079*sW, 678*sH, 191*sW, 27*sH, tocolor(0, 0, 0, 180), true)
                    dxDrawRectangle(1084*sW, 683*sH, 181*sW, 17*sH, tocolor(0, 0, 0, 80), true)
                    dxDrawRectangle(1084*sW, 683*sH, 181*sW/100*vehiclehealth, 17*sH, tocolor(8, 252, 104, 255), true)
                    dxDrawText("ŻYCIE", 1084*sW, 683*sH, 1265*sW, 700*sH, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
		            dxDrawRectangle(1079*sW, 646*sH, 191*sW, 27*sH, tocolor(0, 0, 0, 180), true)
                    dxDrawText(KMH.." KM/H", 1084*sW, 651*sH, 1265*sW, 668*sH, tocolor(255, 255, 255, 255), 1.15, "default-bold", "center", "center", false, false, true, false, false)
                    --dxDrawText(vehiclehealth.."/100", 1203*sW, 1020*sH, 1260*sW, 270*sH, tocolor(156, 254, 133, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)		
		end
	end
addEventHandler("onClientRender", root, drawVehicleHUD)