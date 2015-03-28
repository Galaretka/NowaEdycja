local playerDataTable = {
{"skin"},{"Woman Clothing"},{"Survivor Clothing"} -- É obrigatório ter essas seguientes skins.(Caso você já tenha mas com nome diferente, altere os nomes)
}

function sexo()
showCursor(true)

wal = -- Walpaper \/
guiCreateStaticImage(0, 0, 1, 1, "images/wal.jpg", true)
fundo = -- Imagem de fundo onde irá ficar a opção de escolha \/
guiCreateStaticImage(0.15, 0.28, 0.72, 0.63, "images/fundo.png", true, wal)
home = -- Imagem do Homem \/
guiCreateStaticImage(0.2, 0.28, 0.2, 0.6, "images/home.png", true,fundo)
mulher = -- Imagem da Mulher \/
guiCreateStaticImage(0.6, 0.28, 0.2, 0.6, "images/mulher.png", true,fundo)
addEventHandler("onClientGUIClick", home, playersexo)
addEventHandler("onClientGUIClick", mulher, playersexo)
addEventHandler("onClientMouseEnter", home, home1, false)
addEventHandler("onClientMouseLeave", home, home2, false)
addEventHandler("onClientMouseEnter", mulher, mulher1, false)
addEventHandler("onClientMouseLeave", mulher, mulher2, false)
for i, data in ipairs(playerDataTable) do if data[1] == "skin" then
setElementModel(localPlayer, 73) end end
end addEvent("sex",true) addEventHandler("sex",root,sexo)
-----------------------------------------------------------------------

-----------------------------------------------------------------------
function playersexo()
    showCursor(false)
    destroyElement(wal)
    destroyElement(fundo)
    destroyElement(mulher)
    destroyElement(home)
    if(source ~= mulher) then
        setElementModel(localPlayer, 0)
    for i, data in ipairs(playerDataTable) do
        if data[1] == "skin" then
        
        setElementData(localPlayer, data[1], 1) -- "73" ID da sua skin homem.
   
      end
end
    elseif(source ~= homem) then
        setElementModel(localPlayer, 0)
    for i, data in ipairs(playerDataTable) do
        if data[1] == "skin" then
        
        setElementData(localPlayer, data[1], 1) -- "178" ID da sua skin mulher.
        
        end
      end
   end
end
-----------------------------------------------------------------------

function home1()
guiStaticImageLoadImage(home, "images/homem2.png")end -- Passou o mause na opção do "Homem"
function home2()
guiStaticImageLoadImage(home, "images/home.png")end -- Tirou o mause na opção do "Homem"
function mulher1()
guiStaticImageLoadImage(mulher, "images/mulher2.png")end -- Passou o mause na opção da "Mulher"
function mulher2()
guiStaticImageLoadImage(mulher, "images/mulher.png")end -- Tirou o mause na opção da "Mulher"

-----------------------------------------------------------------------

