local screenWidth,screenHeight = guiGetScreenSize()

function createText1()
    dxDrawImage(screenWidth*0.96,screenHeight*0.411,screenHeight*0.065,screenHeight*0.065,"sound.png",0,0,0,tocolor(150,250,140))
    local sound = getElementData(getLocalPlayer(),"volume")/20
    if sound >1 then
    dxDrawImage(screenWidth*0.94,screenHeight*0.41,screenHeight*0.075,screenHeight*0.075,"level_" ..sound.. ".png",0,0,0,tocolor(100,255,100))
    end
    dxDrawImage(screenWidth*0.96,screenHeight*0.476,screenHeight*0.065,screenHeight*0.065,"eye.png",0,0,0,tocolor(150,250,140))
    local sound = getElementData(getLocalPlayer(),"visibly")/20
    if sound >1 then
    dxDrawImage(screenWidth*0.94,screenHeight*0.475,screenHeight*0.075,screenHeight*0.075, "level_" ..sound.. ".png",0,0,0,tocolor(150,255,140))
    end
    if getElementData(getLocalPlayer(),"brokenbone",true) then
    dxDrawImage(screenWidth*0.96,screenHeight*0.55,screenHeight*0.070,screenHeight*0.070,"7.png",0,0,0,tocolor(255,255,255))
    end
	dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"hiro.png",0,0,0,tocolor(250,250,250))
  --[[  if getElementData(getLocalPlayer(),"humanity") >= 3000 then   
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b3.png",0,0,0,tocolor(100,200,100))
    end   
    if getElementData(getLocalPlayer(),"humanity") >= 2000 and getElementData(getLocalPlayer(),"humanity") <=3000 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b4.png",0,0,0,tocolor(131,200,131))
    end
	if getElementData(getLocalPlayer(),"humanity") >= 1000 and getElementData(getLocalPlayer(),"humanity") <=2000 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b5.png",0,0,0,tocolor(150,200,140))
    end
	if getElementData(getLocalPlayer(),"humanity") >= 0 and getElementData(getLocalPlayer(),"humanity") <=1000 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b6.png",0,0,0,tocolor(140,200,140))
    end
	if getElementData(getLocalPlayer(),"humanity") <= -1000 and getElementData(getLocalPlayer(),"humanity") >= -1 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b6.png",0,0,0,tocolor(150,200,150))
    end
	if getElementData(getLocalPlayer(),"humanity") >= -2000 and getElementData(getLocalPlayer(),"humanity") <= -999 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b6.png",0,0,0,tocolor(140,200,140))
    end
    if getElementData(getLocalPlayer(),"humanity") >= -3000 and getElementData(getLocalPlayer(),"humanity") <= -2000 then
    dxDrawImage(screenWidth*0.96,screenHeight*0.63,screenHeight*0.065,screenHeight*0.065,"b6.png",0,0,0,tocolor(200,200,131))
    end]]
    dxDrawImage(screenWidth*0.96,screenHeight*0.70,screenHeight*0.070,screenHeight*0.070,"t2.png",0,0,0,tocolor(250,250,250))  
    if getElementData(getLocalPlayer(),"temperature") >= 35 and getElementData(getLocalPlayer(),"temperature") <=36 then  
    elementtemp2 = dxDrawImage(screenWidth*0.96,screenHeight*0.7,screenHeight*0.070,screenHeight*0.070,"t4.png",0,0,0,tocolor(100,200,100))
    end
    if getElementData(getLocalPlayer(),"temperature") >= 36 and getElementData(getLocalPlayer(),"temperature") <=37 then 
    elementtemp4 = dxDrawImage(screenWidth*0.96,screenHeight*0.7,screenHeight*0.070,screenHeight*0.070,"t3.png",0,0,0,tocolor(131,200,131))
    end
    if getElementData(getLocalPlayer(),"temperature") >= 37 then
    elementtemp = dxDrawImage(screenWidth*0.96,screenHeight*0.7,screenHeight*0.070,screenHeight*0.070,"t3.png",0,0,0,tocolor(150,200,140))
    end
	if getElementData(getLocalPlayer(),"temperature") <= 37 then
    end
    dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w1.png",0,0,0,tocolor(250,255,250))  
   	if getElementData(getLocalPlayer(),"liquid") >= 1 then 
    elementdrink1 = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w2.png",0,0,0,tocolor(50,50,50,150))
    end
	if getElementData(getLocalPlayer(),"liquid") <= 10 then  
    elementdrink1 = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w2.png",0,0,0,tocolor(100,50,50,131))
    end  
   	if getElementData(getLocalPlayer(),"liquid") >= 10 and getElementData(getLocalPlayer(),"liquid") <= 20 then
    elementdrink = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w6.png",0,0,0,tocolor(150,0,0))
    end
	if getElementData(getLocalPlayer(),"liquid") >= 20 and getElementData(getLocalPlayer(),"liquid") <= 40 then
    elementdrink = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w5.png",0,0,0,tocolor(200,90,90))
    end
	if getElementData(getLocalPlayer(),"liquid") >= 40 and getElementData(getLocalPlayer(),"liquid") <= 60 then    
    elementdrink4 = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w4.png",0,0,0,tocolor(180,150,100))
    end
	if getElementData(getLocalPlayer(),"liquid") >= 60 and getElementData(getLocalPlayer(),"liquid") <= 80 then  
    elementdrink2 = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w3.png",0,0,0,tocolor(131,241,131))
    end
	if getElementData(getLocalPlayer(),"liquid") >= 80 then  
    elementdrink1 = dxDrawImage(screenWidth*0.96,screenHeight*0.775,screenHeight*0.070,screenHeight*0.070,"w2.png",0,0,0,tocolor(100,200,100))
    end
    dxDrawImage(screenWidth*0.96,screenHeight*0.9249,screenHeight*0.071,screenHeight*0.071,"c1.png",0,0,0,tocolor(255,255,255))
    if getElementData(getLocalPlayer(),"calories") >= 1 then 
    elementcalories = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c2.png",0,0,0,tocolor(100,255,100,10))
	end
	if getElementData(getLocalPlayer(),"calories") < 15 then  
    elementcalories = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c2.png",0,0,0,tocolor(152,55,50,151))
    end
	if getElementData(getLocalPlayer(),"calories") >= 15 and getElementData(getLocalPlayer(),"calories") < 30 then
    elementcalories1 = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c6.png",0,0,0,tocolor(200,90,90))
    end
    if getElementData(getLocalPlayer(),"calories") >= 30 and getElementData(getLocalPlayer(),"calories") < 50 then  
    elementcalories2 = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c5.png",0,0,0,tocolor(180,150,100))
    end
    if getElementData(getLocalPlayer(),"calories") >= 50 and getElementData(getLocalPlayer(),"calories") < 70 then
    elementcalories4 = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c3.png",0,0,0,tocolor(131,241,131))
    end
    if getElementData(getLocalPlayer(),"calories") >= 70 then   
    elementcalories = dxDrawImage(screenWidth*0.96,screenHeight*0.925,screenHeight*0.070,screenHeight*0.070,"c2.png",0,0,0,tocolor(100,200,100))
    end
    dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.071,screenHeight*0.071,"s12.png",0,0,0)
	if getElementData(getLocalPlayer(),"blood") >= 8000 and getElementData(getLocalPlayer(),"blood") <= 12000 then    
    elementblood1 = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s10.png",0,0,0,tocolor(100,245,110))
    end
	if getElementData(getLocalPlayer(),"blood") <= 1000 then   
    elementblood1 = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s10.png",0,0,0,tocolor(150,50,50,131))
    end
    if getElementData(getLocalPlayer(),"blood") >= 1000 and getElementData(getLocalPlayer(),"blood") <= 2000 then   
    elementblood = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s2.png",0,0,0,tocolor(255,0,0))
    end  
	if getElementData(getLocalPlayer(),"blood") >= 2000 and getElementData(getLocalPlayer(),"blood") <= 4000 then  
    elementblood4 = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s4.png",0,0,0,tocolor(250,50,50))
    end
	if getElementData(getLocalPlayer(),"blood") >= 4000 and getElementData(getLocalPlayer(),"blood") <= 6000 then  
    elementblood3 = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s6.png",0,0,0,tocolor(250,100,100))
    end
    if getElementData(getLocalPlayer(),"blood") >= 6000 and getElementData(getLocalPlayer(),"blood") <= 8000 then
    elementblood2 = dxDrawImage(screenWidth*0.96,screenHeight*0.85,screenHeight*0.070,screenHeight*0.070,"s8.png",0,0,0,tocolor(250,150,150))
    end
	if getElementData(getLocalPlayer(), "infection") then
    dxDrawImage(screenWidth * 0.94, screenHeight * 0.83, screenHeight * 0.065, screenHeight * 0.065, "6.png", 0, 0, 0, tocolor(255, 255, 255, fading))
    end
end
  
function HandleTheRendering()
 if render then
    removeEventHandler("onClientRender",root,createText1)
    render = false
 else
   addEventHandler("onClientRender",root,createText1)
   render = true
 end
end
addEventHandler("onClientResourceStart",resourceRoot,HandleTheRendering)  
 
bindKey("F3","down",HandleTheRendering)