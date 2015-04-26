local buttons = {}
function standartButton(x, y, wx, hy, text, size, parent)
	button = guiCreateStaticImage(x, y, wx, hy, "data/leave2.png", true, parent or nil)
	table.insert(buttons,button)
	guiBringToFront(button)
	label = guiCreateLabel(0, 0, 1, 1, text, true, button)
	setElementData(label, "parent", button)
	guiSetFont(label, guiCreateFont("data/font.ttf", size))
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	addEventHandler("onClientMouseEnter", label, standart1, false)
	addEventHandler("onClientMouseLeave", label, standart2, false)
	return label
end

function standart1()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage (parent,"data/enter2.png")
end

function standart2()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage (parent,"data/leave2.png")
end