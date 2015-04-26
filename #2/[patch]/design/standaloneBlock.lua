function standaloneBlock(x, y, wx, hy, text, size, parent)
	block = guiCreateStaticImage(x, y, wx, hy, "data/leave2.png", true, parent or nil)
	label = guiCreateLabel(0, 0, 1, 1, text, true, block)
	guiSetFont(label, guiCreateFont("data/font.ttf", size))
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	return label
end