private
initializeReasonPanel
	reasonPanel widget
		addMorphBack:
			(IceTipReadOnlyTextMorph new
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				contentsWrapped: self model longStatus;
				yourself)