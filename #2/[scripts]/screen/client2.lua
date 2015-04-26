local wx, hy = guiGetScreenSize()
local screenSource = dxCreateScreenSource(wx, hy)
local darkness = 0.4
local radius = 4

addEventHandler("onClientResourceStart", resourceRoot, function()
	vignetteShader = dxCreateShader("fx/vignette.fx")
end)

addEventHandler("onClientPreRender", getRootElement(), function()
	dxUpdateScreenSource(screenSource)
	if(vignetteShader) then
		dxSetShaderValue(vignetteShader, "ScreenSource", screenSource);
		dxSetShaderValue(vignetteShader, "radius", radius);
		dxSetShaderValue(vignetteShader, "darkness", darkness);
		dxDrawImage(0, 0, wx, hy, vignetteShader)
	end
end)