function fxScreenSA(vision, enable)
	if (vision == "blackwhite") then
		if enable then
			if enableMotion == true then enableMotion = false return end
			if enableBlackwhite then return end
			blackwhite = dxCreateShader("fx/blackwhite.fx")
			screenSource = dxCreateScreenSource(wh, hy)
			if blackwhite and screenSource then
				dxSetShaderValue(blackwhite, "screenSource", screenSource)
				addEventHandler("onClientHUDRender", getRootElement(), createBlackwhite)
			end
			enableBlackwhite = true
		else
			if blackwhite and screenSource then
				destroyElement(blackwhite)
				destroyElement(screenSource)
				blackwhite, screenSource = nil, nil
				removeEventHandler("onClientHUDRender", getRootElement(), createBlackwhite)
				enableBlackwhite = false
			end
		end
	elseif (vision == "motion") then
		if enable then
			if enableBlackwhite == true then enableBlackwhite = false return end
			if enableMotion then return end
			motion = dxCreateShader("fx/motion.fx")
			screenSrc = dxCreateScreenSource(wh, hy)
			if motion and screenSrc then
				dxSetShaderValue(motion, "ScreenTexture", screenSrc)
				addEventHandler("onClientHUDRender", getRootElement(), createMotion)
			end
			enableMotion = true
		else
			if motion and screenSrc then
				destroyElement(motion)
				destroyElement(screenSrc)
				motion, screenSrc = nil, nil
				removeEventHandler("onClientHUDRender", getRootElement(), createMotion)
				enableMotion = false
			end
		end
	end
end