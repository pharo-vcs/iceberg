private
refreshDetailPanel
	detailPanel widget removeAllMorphs.
	selectedOption ifNotNil: [ 
		detailPanel widget 
			addMorphBack: (IceTipReadOnlyTextMorph new 
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				contentsWrapped: selectedOption help;
				yourself) ]