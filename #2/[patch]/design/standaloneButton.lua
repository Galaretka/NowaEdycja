function standaloneButton(x, y, wx, hy, text, size, parent)
	button = guiCreateStaticImage(x, y, wx, hy, "data/leave1.png", true, parent or nil)
	guiBringToFront(button)
	label = guiCreateLabel(0, 0, 1, 1, text, true, button)
	guiBringToFront(label)
	setElementData(label, "parent", button)
	guiSetFont(label, guiCreateFont("data/font.ttf", size or 1))
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	addEventHandler("onClientMouseEnter", label, standalone1, false)
	addEventHandler("onClientMouseLeave", label, standalone2, false)
	return label
end

function standalone1()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage(parent,"data/enter1.png")
end

function standalone2()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage(parent,"data/leave1.png")
end