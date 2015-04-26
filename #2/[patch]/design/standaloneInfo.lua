function standaloneInfo(x, y, wx, hy, text, size, parent)
	label = guiCreateLabel(x, y, wx, hy, text, true, parent or nil)
	guiSetFont(label, guiCreateFont("data/font.ttf", size or 1))
	guiLabelSetVerticalAlign(label, "center")
	guiLabelSetHorizontalAlign(label, "center")
	return label
end