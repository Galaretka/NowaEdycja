addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),function(object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Drut kolczasty")
	local itemPickup = createItemPickup(item,x,y,z,itemString)
	if isElement(getElementData(object,"parent")) then destroyElement(getElementData(object,"parent")) end
	if isElement(object) then destroyElement(object) end
end)

addEvent("removeTent",true)
addEventHandler("removeTent",getRootElement(),function(object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Namiot")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	if isElement(getElementData(object,"parent")) then destroyElement(getElementData(object,"parent")) end
	if isElement(object) then destroyElement(object) end
	setElementData(source,"currentCol",false)
end)

addEvent("createArrow",true)
addEventHandler("createArrow",getRootElement(),function(x,y,z,vz,hitElement)
	local item,itemString = getItemTablePosition("Strzała")
	local itemPickup = createItemPickup(item,x,y,z,itemString,vz, 1.75)
	if isElement(hitElement) then
	attachElements ( itemPickup, hitElement, 0, 0, 0 )
	end
end)