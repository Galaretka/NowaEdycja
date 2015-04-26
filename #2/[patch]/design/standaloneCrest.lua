local buttons = {}
function standaloneCrest(x, y, wx, hy, state, parent)
	button = guiCreateStaticImage(x, y, wx, hy, "data/leave3.png", state, parent or nil)
	table.insert(buttons,button)
	guiBringToFront(button)
	setElementData(button, "parent", button)
	addEventHandler("onClientMouseEnter", button, crest1, false)
	addEventHandler("onClientMouseLeave", button, crest2, false)
	return button
end

function crest1()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage (parent,"data/enter3.png")
end

function crest2()
	parent = getElementData(source,"parent")
	guiStaticImageLoadImage (parent,"data/leave3.png")
end