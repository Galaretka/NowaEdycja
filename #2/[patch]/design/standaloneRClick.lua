function standaloneRClick(x, y, wx, hy)
	button = guiCreateStaticImage(x, y, wx, hy, "data/leave4.png", true)
	label = guiCreateLabel(0, 0, 1, 1, "", true, button)
	setElementData(label, "parent", button)
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	addEventHandler("onClientMouseEnter", label, RClick1, false)
	addEventHandler("onClientMouseLeave", label, RClick2, false)
	return label
end

function RClick1()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage(parent,"data/enter4.png")
end

function RClick2()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage(parent,"data/leave4.png")
end